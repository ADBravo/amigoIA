import 'package:flutter/material.dart';
import '../../routes/router.dart';
import '../../services/auth/authService.dart';

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
      appBar: AppBar(title: Text('Iniciar sesión')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: emailCtrl, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: passCtrl, decoration: InputDecoration(labelText: 'Contraseña'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text('Entrar')),
            TextButton(onPressed: _goToRegister, child: Text('Crear cuenta')),
            if (error.isNotEmpty) Text(error, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}