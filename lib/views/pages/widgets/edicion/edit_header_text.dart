import 'package:flutter/material.dart';

class EditHeaderText extends StatelessWidget {
  const EditHeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Actualiza tu información',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Por seguridad, necesitamos verificar tu contraseña',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}