import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;

  const StyledTextField({
    required this.controller,
    required this.label,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE8E8E8),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Color(0xFF2C3E50),
            fontWeight: FontWeight.bold,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}