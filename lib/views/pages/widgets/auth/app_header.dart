import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AppHeader({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: title.length > 7 ? 48 : 52,
            fontWeight: FontWeight.w900,
            color: Color(0xFF0077B6),
            letterSpacing: 3,
            fontFamily: 'Courier',
            shadows: [
              Shadow(
                color: Colors.black26,
                offset: Offset(3, 3),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C3E50),
            fontStyle: FontStyle.italic,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.purple, size: 24),
            SizedBox(width: 8),
            Icon(Icons.star, color: Colors.pink, size: 20),
          ],
        ),
      ],
    );
  }
}