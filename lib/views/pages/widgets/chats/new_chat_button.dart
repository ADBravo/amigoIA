import 'package:flutter/material.dart';

class NewChatButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NewChatButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0077B6), Color(0xFF00B4D8)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 119, 182, 0.5),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Text(
            'Nueva Conversación',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}