import 'package:flutter/material.dart';
import '../../../../models/message/messageModel.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;
  final bool isUser;
  final bool showAvatar;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.isUser,
    required this.showAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser && showAvatar) _buildAvatar(),
          if (!isUser && !showAvatar) const SizedBox(width: 40),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isUser ? Colors.blue[600] : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(18),
                  topRight: const Radius.circular(18),
                  bottomLeft: Radius.circular(isUser ? 18 : 4),
                  bottomRight: Radius.circular(isUser ? 4 : 18),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.content,
                    style: TextStyle(
                      color: isUser ? Colors.white : Colors.black87,
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatTime(message.timestamp),
                    style: TextStyle(
                      color: isUser ? Colors.white70 : Colors.grey[600],
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isUser && showAvatar) _buildAvatar(),
          if (isUser && !showAvatar) const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isUser ? Colors.blue[100] : Colors.grey[300],
          shape: BoxShape.circle,
        ),
        child: Icon(
          isUser ? Icons.person : Icons.smart_toy_outlined,
          size: 18,
          color: isUser ? Colors.blue[700] : Colors.grey[700],
        ),
      ),
    );
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays == 0) {
      return DateFormat('HH:mm').format(timestamp);
    } else if (difference.inDays == 1) {
      return 'Ayer ${DateFormat('HH:mm').format(timestamp)}';
    } else {
      return DateFormat('dd/MM/yyyy HH:mm').format(timestamp);
    }
  }
}