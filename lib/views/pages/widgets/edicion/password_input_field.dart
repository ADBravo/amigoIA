import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscurePassword;
  final VoidCallback onToggleVisibility;

  const PasswordInputField({
    Key? key,
    required this.controller,
    required this.obscurePassword,
    required this.onToggleVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscurePassword,
      decoration: InputDecoration(
        labelText: 'Contraseña actual',
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(
            obscurePassword ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: onToggleVisibility,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Por favor ingresa tu contraseña';
        }
        return null;
      },
    );
  }
}