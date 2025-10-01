import 'package:flutter/material.dart';

class ChatDialogs {
  static Future<String?> showRenameDialog(
    BuildContext context,
    String currentTitle,
  ) {
    final controller = TextEditingController(text: currentTitle);

    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          'Renombrar chat',
          style: TextStyle(
            color: Color(0xFF0077B6),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Nuevo nombre',
            filled: true,
            fillColor: Color(0xFFE8E8E8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancelar',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, controller.text.trim()),
            child: Text(
              'Guardar',
              style: TextStyle(
                color: Color(0xFF0077B6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Future<bool?> showDeleteDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          '¿Eliminar chat?',
          style: TextStyle(
            color: Color(0xFF0077B6),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text('Esta acción no se puede deshacer'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'Cancelar',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              'Eliminar',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Future<bool?> showLogoutDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          '¿Cerrar sesión?',
          style: TextStyle(
            color: Color(0xFF0077B6),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text('¿Estás seguro de que quieres cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'Cancelar',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              'Cerrar sesión',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}