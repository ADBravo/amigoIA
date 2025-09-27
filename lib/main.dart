import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'views/viewRouter.dart';
import 'routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  final name = await AppRouter.user.getName();

  runApp(MyApp(initialRoute: name == null ? '/name' : '/chats'));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AmigoIA',
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: initialRoute,
      onGenerateRoute: viewRouter,
    );
  }
}