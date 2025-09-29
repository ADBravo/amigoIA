import 'package:flutter/material.dart';
import '../../routes/router.dart';

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
      appBar: AppBar(title: Text('Crear cuenta')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: emailCtrl, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: passCtrl, decoration: InputDecoration(labelText: 'Contraseña'), obscureText: true),
            TextField(controller: nameCtrl, decoration: InputDecoration(labelText: 'Nombre')),
            DropdownButton<String>(
              value: gender,
              items: ['Masculino', 'Femenino', 'Otro'].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
              onChanged: (g) => setState(() => gender = g ?? 'Otro'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _register, child: Text('Registrarse')),
            TextButton(onPressed: _goToLogin, child: Text('Ya tengo cuenta')),
            if (error.isNotEmpty) Text(error, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}