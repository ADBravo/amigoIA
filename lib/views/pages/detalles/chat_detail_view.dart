import 'package:flutter/material.dart';
import '../../../routes/router.dart';
import '../../../models/message/messageModel.dart';
import '../widgets/detalles/message_bubble.dart';
import '../widgets/detalles/message_input.dart';
import '../widgets/detalles/chat_app_bar.dart';

class ChatDetailView extends StatefulWidget {
  final int chatId;
  const ChatDetailView({Key? key, required this.chatId}) : super(key: key);

  @override
  State<ChatDetailView> createState() => _ChatDetailViewState();
}

class _ChatDetailViewState extends State<ChatDetailView> {
  List<MessageModel> messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isLoading = true;
  bool isSending = false;

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadMessages() async {
    try {
      setState(() => isLoading = true);
      final result = await AppRouter.message.getMessages(widget.chatId);
      if (mounted) {
        setState(() {
          messages = result;
          isLoading = false;
        });
        _scrollToBottom();
      }
    } catch (e) {
      if (mounted) {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar mensajes: $e')),
        );
      }
    }
  }

  void _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty || isSending) return;

    setState(() => isSending = true);

    // Crear mensaje temporal para mostrar inmediatamente
    final tempMessage = MessageModel(
      id: DateTime.now().millisecondsSinceEpoch, // ID temporal
      chatId: widget.chatId,
      sender: 'user',
      content: text,
      timestamp: DateTime.now(),
    );

    // Agregar mensaje temporal a la lista
    setState(() {
      messages.add(tempMessage);
    });

    _controller.clear();
    _scrollToBottom();

    try {
      // Enviar mensaje al servidor
      await AppRouter.message.sendMessage(widget.chatId, text);
      
      // Recargar mensajes para obtener respuesta del asistente
      await _loadMessages();
    } catch (e) {
      if (mounted) {
        // Remover mensaje temporal si falla
        setState(() {
          messages.removeWhere((msg) => msg.id == tempMessage.id);
          isSending = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al enviar mensaje: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => isSending = false);
      }
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const ChatAppBar(),
      body: Column(
        children: [
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : messages.isEmpty
                    ? _buildEmptyState()
                    : _buildMessageList(),
          ),
          MessageInput(
            controller: _controller,
            onSend: _sendMessage,
            isSending: isSending,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            '¡Inicia la conversación!',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Escribe un mensaje para comenzar',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: messages.length,
      itemBuilder: (_, i) {
        final msg = messages[i];
        final isUser = msg.sender == 'user';
        final showAvatar = i == 0 || messages[i - 1].sender != msg.sender;
        
        return MessageBubble(
          message: msg,
          isUser: isUser,
          showAvatar: showAvatar,
        );
      },
    );
  }
}