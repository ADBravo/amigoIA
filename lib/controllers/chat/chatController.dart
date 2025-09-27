import '../../../models/chat/chatModel.dart';
import '../../../services/db/dbService.dart';

class ChatController {
  Future<int> createChat(String title) async {
    final db = await DBService.database;
    return await db.insert('chat', {
      'title': title,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  Future<List<ChatModel>> getChats() async {
    final db = await DBService.database;
    final result = await db.query('chat', orderBy: 'createdAt DESC');
    return result.map((e) => ChatModel.fromMap(e)).toList();
  }

  Future<void> updateChatTitle(int chatId, String newTitle) async {
    final db = await DBService.database;
    await db.update('chat', {'title': newTitle}, where: 'id = ?', whereArgs: [chatId]);
  }

  Future<void> deleteChat(int chatId) async {
    final db = await DBService.database;
    await db.delete('message', where: 'chatId = ?', whereArgs: [chatId]);
    await db.delete('chat', where: 'id = ?', whereArgs: [chatId]);
  }
}