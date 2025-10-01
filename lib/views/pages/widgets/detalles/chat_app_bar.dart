import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.smart_toy_outlined,
              color: Colors.blue[700],
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tu amigo fiel',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'En línea',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.green[600],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}