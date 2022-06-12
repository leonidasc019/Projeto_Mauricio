import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto/screens/escrever_diario.dart';
import 'package:projeto/widgets/login.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PaginaLogin(),
      //  initialRoute: '/home',
      routes: {
        '/home': (context) => const PaginaLogin(),
        '/second': (context) => const PaginaEscrever(),
      },
    );
  }
}
