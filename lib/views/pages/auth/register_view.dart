import 'package:flutter/material.dart';
import '../../../routes/router.dart';
import '../widgets/auth/decorative_background.dart';
import '../widgets/auth/app_header.dart';
import '../widgets/auth/styled_text_field.dart';
import '../widgets/auth/styled_dropdown.dart';
import '../widgets/auth/gradient_button.dart';
import '../widgets/auth/error_message.dart';
import '../widgets/auth/auth_redirect_text.dart';

class RegisterView extends StatefulWidget {
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  String gender = 'Otro';
  String error = '';

  void _register() async {
    final email = emailCtrl.text.trim();
    final pass = passCtrl.text.trim();
    final name = nameCtrl.text.trim();
    if (email.isEmpty || pass.isEmpty || name.isEmpty) {
      setState(() => error = 'Completa todos los campos');
      return;
    }
    try {
      await AppRouter.user.register(email, pass, name, gender);
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      setState(() => error = 'Error al registrar: ${e.toString()}');
    }
  }

  void _goToLogin() {
    Navigator.pushReplacementNamed(context, '/login');
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
                      title: 'REGISTRO',
                      subtitle: 'Crea tu cuenta en AMIGO',
                    ),
                    SizedBox(height: 25),
                    StyledTextField(
                      controller: nameCtrl,
                      label: 'NOMBRE',
                    ),
                    SizedBox(height: 15),
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
                    SizedBox(height: 15),
                    StyledDropdown(
                      value: gender,
                      items: ['Masculino', 'Femenino', 'Otro'],
                      onChanged: (g) => setState(() => gender = g ?? 'Otro'),
                      label: 'GÉNERO',
                    ),
                    SizedBox(height: 20),
                    GradientButton(
                      text: 'Registrarse',
                      onPressed: _register,
                    ),
                    SizedBox(height: 10),
                    AuthRedirectText(
                      question: 'Ya tengo cuenta',
                      actionText: 'Iniciar sesión',
                      onPressed: _goToLogin,
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