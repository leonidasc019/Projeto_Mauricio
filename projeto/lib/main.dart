import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto/provider/diario_provider.dart';
import 'package:projeto/screens/escrever_diario.dart';
import 'package:projeto/screens/home_screen.dart';
import 'package:projeto/widgets/login.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider<DiarioProvider>(
    create: (context) => DiarioProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PaginaLogin(),
      routes: {
        '/home': (context) => const PaginaLogin(),
        '/second': (context) => const HomeScreen(),
        '/third': (context) => const PaginaEscrever(),
      },
    );
  }
}
