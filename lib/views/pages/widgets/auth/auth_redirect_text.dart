import 'package:flutter/material.dart';

class AuthRedirectText extends StatelessWidget {
  final String question;
  final String actionText;
  final VoidCallback onPressed;

  const AuthRedirectText({
    required this.question,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: TextStyle(
            color: Color(0xFF2C3E50),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 8),
        TextButton(
          onPressed: onPressed,
          child: Text(
            actionText,
            style: TextStyle(
              color: Color(0xFF0077B6),
              fontSize: 14,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}