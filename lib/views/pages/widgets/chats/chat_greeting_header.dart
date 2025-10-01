import 'package:flutter/material.dart';

class ChatGreetingHeader extends StatelessWidget {
  final String userName;

  const ChatGreetingHeader({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text(
            'Bonito verte de nuevo',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: Color(0xFF0077B6),
              fontFamily: 'Courier',
              shadows: [
                Shadow(
                  color: Colors.black26,
                  offset: Offset(2, 2),
                  blurRadius: 3,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Text(
            userName.split(' ').skip(2).join(' '),
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0077B6),
              fontFamily: 'Courier',
            ),
          ),
        ],
      ),
    );
  }
}