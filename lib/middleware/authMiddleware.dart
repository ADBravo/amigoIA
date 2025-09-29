import 'package:flutter/material.dart';
import '../services/auth/authService.dart';
import '../views/pages/login_view.dart';

/// Middleware que protege rutas si el usuario no ha iniciado sesión.
/// Si no hay sesión activa, redirige automáticamente a LoginView.
Route<dynamic> protectedRoute(RouteSettings settings, Widget Function() builder) {
  final isLoggedIn = AuthService.isLoggedIn;

  return MaterialPageRoute(
    builder: (_) => isLoggedIn ? builder() : LoginView(),
    settings: settings,
  );
}