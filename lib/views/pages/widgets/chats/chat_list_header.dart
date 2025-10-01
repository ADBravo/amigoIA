import 'package:flutter/material.dart';

class ChatListHeader extends StatelessWidget {
  final VoidCallback onSettings;
  final VoidCallback onLogout;

  const ChatListHeader({
    required this.onSettings,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.settings, color: Color(0xFF0077B6)),
            onPressed: onSettings,
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.red),
            onPressed: onLogout,
          ),
        ],
      ),
    );
  }
}