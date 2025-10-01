import 'package:flutter/material.dart';
import '../../../../models/chat/chatModel.dart';

class ChatItemCard extends StatelessWidget {
  final ChatModel chat;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ChatItemCard({
    required this.chat,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: Color(0xFF0077B6),
          child: Icon(Icons.chat, color: Colors.white),
        ),
        title: Text(
          chat.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        subtitle: Text(
          _formatDate(chat.createdAt),
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        onTap: onTap,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit, color: Color(0xFF0077B6)),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    
    if (diff.inDays == 0) {
      return 'Hoy ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    } else if (diff.inDays == 1) {
      return 'Ayer';
    } else if (diff.inDays < 7) {
      return '${diff.inDays} días atrás';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}