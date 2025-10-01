import 'chat/chatRouter.dart';
import 'message/messageRouter.dart';
import 'user/userRouter.dart';

class AppRouter {
  static final user = UserRouter();
  static final chat = ChatRouter();
  static final message = MessageRouter();
}