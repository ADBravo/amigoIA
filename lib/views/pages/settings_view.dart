import 'package:flutter/material.dart';
import '../../routes/router.dart';

class SettingsView extends StatefulWidget {
  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final TextEditingController _controller = TextEditingController();

  void _updateName() async {
    final name = _controller.text.trim();
    if (name.isNotEmpty) {
      await AppRouter.user.updateName(name);
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    AppRouter.user.getName().then((name) {
      if (name != null) _controller.text = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configuración')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: _controller, decoration: InputDecoration(labelText: 'Tu nombre')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _updateName, child: Text('Actualizar')),
          ],
        ),
      ),
    );
  }
}
