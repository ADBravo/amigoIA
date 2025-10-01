import 'package:flutter/material.dart';
import '../../../routes/router.dart';
import '../../../models/chat/chatModel.dart';
import '../../../services/auth/authService.dart';
import '../widgets/chats/chat_list_header.dart';
import '../widgets/chats/empty_chat_state.dart';
import '../widgets/chats/chat_greeting_header.dart';
import '../widgets/chats/chat_item_card.dart';
import '../widgets/chats/new_chat_button.dart';
import '../widgets/chats/chat_dialogs.dart';
class ChatListView extends StatefulWidget {
  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  List<ChatModel> chats = [];
  String userName = '';

  Future<void> _loadChats() async {
    final result = await AppRouter.chat.getChats();
    final user = await AppRouter.user.getById(AuthService.userId!);

    final nombre = user?.name ?? '';
    final genero = user?.gender ?? 'Otro';

    final saludo = genero == 'Femenino'
        ? 'Hola, amiga 👋'
        : genero == 'Masculino'
        ? 'Hola, amigo 👋'
        : 'Hola 👋';

    setState(() {
      chats = result;
      userName = '$saludo $nombre';
    });
  }

  void _createChat() async {
    final id = await AppRouter.chat.createChat('Nuevo chat');
    await _loadChats();
    Navigator.pushNamed(context, '/chat/$id');
  }

  void _renameChat(ChatModel chat) async {
    final newTitle = await ChatDialogs.showRenameDialog(context, chat.title);

    if (newTitle != null && newTitle.isNotEmpty && newTitle != chat.title) {
      await AppRouter.chat.updateChatTitle(chat.id, newTitle);
      await _loadChats();
    }
  }

  void _deleteChat(ChatModel chat) async {
    final confirm = await ChatDialogs.showDeleteDialog(context);

    if (confirm == true) {
      await AppRouter.chat.deleteChat(chat.id);
      await _loadChats();
    }
  }

  void _editProfile() async {
    await Navigator.pushNamed(context, '/edit-name');
    await _loadChats();
  }

  void _logout() async {
    final confirm = await ChatDialogs.showLogoutDialog(context);

    if (confirm == true) {
      AuthService.logout();
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  void initState() {
    super.initState();
    _loadChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ChatListHeader(
              onSettings: _editProfile,
              onLogout: _logout,
            ),
            Expanded(
              child: chats.isEmpty
                  ? EmptyChatState(
                      userName: userName,
                      onCreateChat: _createChat,
                    )
                  : _buildChatList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatList() {
    return Column(
      children: [
        ChatGreetingHeader(userName: userName),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: chats.length,
            itemBuilder: (_, i) {
              final chat = chats[i];
              return ChatItemCard(
                chat: chat,
                onTap: () => Navigator.pushNamed(context, '/chat/${chat.id}'),
                onEdit: () => _renameChat(chat),
                onDelete: () => _deleteChat(chat),
              );
            },
          ),
        ),
        NewChatButton(onPressed: _createChat),
      ],
    );
  }
}