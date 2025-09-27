import '../../../controllers/chat/chatController.dart';
import '../../../models/chat/chatModel.dart';

class ChatRouter {
  final ChatController _controller = ChatController();

  Future<int> createChat(String title) => _controller.createChat(title);
  Future<List<ChatModel>> getChats() => _controller.getChats();
  Future<void> updateChatTitle(int id, String newTitle) => _controller.updateChatTitle(id, newTitle);
  Future<void> deleteChat(int id) => _controller.deleteChat(id);
}