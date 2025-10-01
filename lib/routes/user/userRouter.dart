import '../../../controllers/user/userController.dart';
import '../../../models/user/userModel.dart';
import '../../services/auth/authService.dart';

class UserRouter {
  final UserController _controller = UserController();

  Future<int> register(
    String email,
    String password,
    String name,
    String gender,
  ) async {
    final user = UserModel(
      id: 0,
      email: email,
      password: password,
      name: name,
      gender: gender,
    );
    return await _controller.register(user);
  }

  Future<UserModel?> login(String email, String password) =>
      _controller.login(email, password);

  Future<UserModel?> getById(int id) => _controller.getById(id);

  Future<bool> updateNameSecure(String password, String newName) {
    final userId = AuthService.userId;
    if (userId == null) return Future.value(false);
    return _controller.updateNameSecure(userId, password, newName);
  }
}
