import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'views/viewRouter.dart';
import 'routes/router.dart';
import 'services/auth/authService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  final initialRoute = AuthService.isLoggedIn ? '/chats' : '/login';

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AmigoIA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: initialRoute,
      onGenerateRoute: viewRouter,
    );
  }
}