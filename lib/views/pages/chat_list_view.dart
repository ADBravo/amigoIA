import 'package:flutter/material.dart';
import '../../routes/router.dart';
import '../../models/chat/chatModel.dart';

class ChatListView extends StatefulWidget {
  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  List<ChatModel> chats = [];
  String userName = '';

  Future<void> _loadChats() async {
    final result = await AppRouter.chat.getChats();
    final name = await AppRouter.user.getName();
    setState(() {
      chats = result;
      userName = name ?? '';
    });
  }

  void _createChat() async {
    final id = await AppRouter.chat.createChat('Nuevo chat');
    await _loadChats();
    Navigator.pushNamed(context, '/chat/$id');
  }

  void _renameChat(ChatModel chat) async {
    final controller = TextEditingController(text: chat.title);

    final newTitle = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Renombrar chat'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(hintText: 'Nuevo nombre'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, controller.text.trim()),
            child: Text('Guardar'),
          ),
        ],
      ),
    );

    if (newTitle != null && newTitle.isNotEmpty && newTitle != chat.title) {
      await AppRouter.chat.updateChatTitle(chat.id, newTitle);
      await _loadChats();
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
      appBar: AppBar(
        title: Text(userName.isNotEmpty ? 'Hola, $userName 👋' : 'Tus chats'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              await Navigator.pushNamed(context, '/settings');
              final name = await AppRouter.user.getName();
              setState(() => userName = name ?? '');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (_, i) {
          final chat = chats[i];
          return ListTile(
            title: Text(chat.title),
            subtitle: Text(chat.createdAt.toLocal().toString()),
            onTap: () => Navigator.pushNamed(context, '/chat/${chat.id}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _renameChat(chat),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    await AppRouter.chat.deleteChat(chat.id);
                    await _loadChats();
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createChat,
        child: Icon(Icons.add),
      ),
    );
  }
}
