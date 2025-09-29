class AuthService {
  static int? _userId;

  static bool get isLoggedIn => _userId != null;
  static int? get userId => _userId;

  static void login(int id) => _userId = id;
  static void logout() => _userId = null;
}