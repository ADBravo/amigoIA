import 'package:flutter/material.dart';
import 'pages/login_view.dart';
import 'pages/register_view.dart';
import 'pages/chat_list_view.dart';
import 'pages/chat_detail_view.dart';
import 'pages/name_edit_view.dart';
import '../middleware/authMiddleware.dart';

Route<dynamic>? viewRouter(RouteSettings settings) {
  final uri = Uri.parse(settings.name ?? '');
  if (uri.pathSegments.isEmpty) return null;

  switch (uri.pathSegments.first) {
    case 'login':
      return MaterialPageRoute(builder: (_) => LoginView());
    case 'register':
      return MaterialPageRoute(builder: (_) => RegisterView());
    case 'chats':
      return protectedRoute(settings, () => ChatListView());
    case 'chat':
      if (uri.pathSegments.length >= 2) {
        final chatId = int.tryParse(uri.pathSegments[1]);
        if (chatId != null) {
          return protectedRoute(settings, () => ChatDetailView(chatId: chatId));
        }
      }
      break;
    case 'edit-name':
      return protectedRoute(settings, () => NameEditView());
  }

  return MaterialPageRoute(
    builder: (_) => Scaffold(
      body: Center(
        child: Text('Ruta no encontrada'),
      ),
    ),
  );
}
