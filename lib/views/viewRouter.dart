import 'package:flutter/material.dart';
import 'pages/name_input_view.dart';
import 'pages/chat_list_view.dart';
import 'pages/chat_detail_view.dart';
import 'pages/settings_view.dart';

Route<dynamic>? viewRouter(RouteSettings settings) {
  final uri = Uri.parse(settings.name ?? '');
  if (uri.pathSegments.isEmpty) return null;

  switch (uri.pathSegments.first) {
    case 'name':
      return MaterialPageRoute(builder: (_) => NameInputView());
    case 'chats':
      return MaterialPageRoute(builder: (_) => ChatListView());
    case 'chat':
      if (uri.pathSegments.length >= 2) {
        final chatId = int.tryParse(uri.pathSegments[1]);
        if (chatId != null) {
          return MaterialPageRoute(builder: (_) => ChatDetailView(chatId: chatId));
        }
      }
      break;
    case 'settings':
      return MaterialPageRoute(builder: (_) => SettingsView());
  }

  return MaterialPageRoute(
    builder: (_) => Scaffold(body: Center(child: Text('Ruta no encontrada'))),
  );
}