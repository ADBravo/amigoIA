import '../../../models/message/messageModel.dart';
import '../../../services/db/dbService.dart';
import '../../../services/ia/iaService.dart';
import '../../../middleware/limiter.dart';
import '../../../routes/router.dart';
import '../../../services/auth/authService.dart';

class MessageController {
  final IAService _ia = IAService();
  final Limiter _limiter = Limiter();

  Future<List<MessageModel>> getMessages(int chatId) async {
    final db = await DBService.database;
    final result = await db.query(
      'message',
      where: 'chatId = ?',
      whereArgs: [chatId],
      orderBy: 'timestamp ASC',
    );
    return result.map((e) => MessageModel.fromMap(e)).toList();
  }

  Future<void> sendMessage(int chatId, String userMessage) async {
    final db = await DBService.database;
    final now = DateTime.now();

    if (!_limiter.isAllowed()) {
      await db.insert('message', {
        'chatId': chatId,
        'sender': 'ai',
        'content':
            'Ey, estás escribiendo muy rápido 😅. Espera ${_limiter.secondsRemaining()} segundos antes de continuar.',
        'timestamp': now.toIso8601String(),
      });
      return;
    }

    await db.insert('message', {
      'chatId': chatId,
      'sender': 'user',
      'content': userMessage,
      'timestamp': now.toIso8601String(),
    });

    if (AuthService.userId == null) return;

    final userModel = await AppRouter.user.getById(AuthService.userId!);
    final userName = userModel?.name ?? 'amigo';
    final userGender = userModel?.gender ?? 'Otro';

    final contextMessages = await getMessages(chatId);
    final contexto = contextMessages
        .map((m) => '${m.sender}: ${m.content}')
        .join('\n');

    final aiResponse = await _ia.responder(userName, userGender, userMessage, contexto);

    await db.insert('message', {
      'chatId': chatId,
      'sender': 'ai',
      'content': aiResponse,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }
}