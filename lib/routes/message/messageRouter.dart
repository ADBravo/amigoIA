import '../../../controllers/message/messageController.dart';
import '../../../models/message/messageModel.dart';

class MessageRouter {
  final MessageController _controller = MessageController();

  Future<List<MessageModel>> getMessages(int chatId) => _controller.getMessages(chatId);
  Future<void> sendMessage(int chatId, String message) => _controller.sendMessage(chatId, message);
}