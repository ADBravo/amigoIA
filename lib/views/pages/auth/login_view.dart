import 'package:flutter/material.dart';
import '../../../routes/router.dart';
import '../../../services/auth/authService.dart';
import '../widgets/auth/decorative_background.dart';
import '../widgets/auth/app_header.dart';
import '../widgets/auth/styled_text_field.dart';
import '../widgets/auth/gradient_button.dart';
import '../widgets/auth/error_message.dart';
import '../widgets/auth/auth_redirect_text.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  String error = '';

  void _login() async {
    final email = emailCtrl.text.trim();
    final pass = passCtrl.text.trim();
    final user = await AppRouter.user.login(email, pass);
    if (user == null) {
      setState(() => error = 'Credenciales inválidas');
    } else {
      AuthService.login(user.id);
      Navigator.pushReplacementNamed(context, '/chats');
    }
  }

  void _goToRegister() {
    Navigator.pushReplacementNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          DecorativeBackground(),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppHeader(
                      title: 'AMIGO',
                      subtitle: 'Conoce tu amigo virtual',
                    ),
                    SizedBox(height: 25),
                    StyledTextField(
                      controller: emailCtrl,
                      label: 'EMAIL',
                    ),
                    SizedBox(height: 15),
                    StyledTextField(
                      controller: passCtrl,
                      label: 'CONTRASEÑA',
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    GradientButton(
                      text: 'Entrar',
                      onPressed: _login,
                    ),
                    SizedBox(height: 10),
                    AuthRedirectText(
                      question: 'No te has registrado',
                      actionText: 'Regístrate',
                      onPressed: _goToRegister,
                    ),
                    ErrorMessage(message: error),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}