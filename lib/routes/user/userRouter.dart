import '../../../controllers/user/userController.dart';

class UserRouter {
  final UserController _controller = UserController();

  Future<void> setName(String name) => _controller.setUserName(name);
  Future<void> updateName(String name) => _controller.updateUserName(name);
  Future<String?> getName() async {
    final user = await _controller.getUser();
    return user?.name;
  }
}
