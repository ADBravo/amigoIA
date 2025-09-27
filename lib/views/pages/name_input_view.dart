import 'package:flutter/material.dart';
import '../../routes/router.dart';

class NameInputView extends StatefulWidget {
  @override
  State<NameInputView> createState() => _NameInputViewState();
}

class _NameInputViewState extends State<NameInputView> {
  final TextEditingController _controller = TextEditingController();

  void _submitName() async {
    final name = _controller.text.trim();
    if (name.isNotEmpty) {
      await AppRouter.user.setName(name);
      Navigator.pushReplacementNamed(context, '/chats');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('¿Cómo te llamas?')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: _controller, decoration: InputDecoration(labelText: 'Tu nombre')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _submitName, child: Text('Continuar')),
          ],
        ),
      ),
    );
  }
}
