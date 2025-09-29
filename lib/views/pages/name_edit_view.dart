import 'package:flutter/material.dart';
import '../../routes/router.dart';
import '../../services/auth/authService.dart';

class NameEditView extends StatefulWidget {
  @override
  State<NameEditView> createState() => _NameEditViewState();
}

class _NameEditViewState extends State<NameEditView> {
  final nameCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  String error = '';

  void _updateName() async {
    final name = nameCtrl.text.trim();
    final pass = passCtrl.text.trim();
    if (name.isEmpty || pass.isEmpty) {
      setState(() => error = 'Completa ambos campos');
      return;
    }

    final success = await AppRouter.user.updateNameSecure(pass, name);
    if (success) {
      Navigator.pop(context);
    } else {
      passCtrl.clear();
      setState(() => error = 'Contraseña incorrecta');
    }
  }

  @override
  void initState() {
    super.initState();
    AppRouter.user.getById(AuthService.userId!).then((user) {
      if (user != null) nameCtrl.text = user.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar nombre')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: nameCtrl, decoration: InputDecoration(labelText: 'Nuevo nombre')),
            TextField(controller: passCtrl, decoration: InputDecoration(labelText: 'Contraseña actual'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _updateName, child: Text('Actualizar')),
            if (error.isNotEmpty) Text(error, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}