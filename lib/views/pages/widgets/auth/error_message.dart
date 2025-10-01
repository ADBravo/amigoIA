import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    if (message.isEmpty) return SizedBox.shrink();
    
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        border: Border.all(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        message,
        style: TextStyle(
          color: Colors.red.shade900,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}