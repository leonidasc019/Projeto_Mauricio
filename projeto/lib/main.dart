import 'package:flutter/material.dart';
import 'package:projeto/screens/escrever_diario.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaginaEscrever(),
      //  initialRoute: '/home',
      routes: {
        '/home': (context) => const PaginaEscrever(),
        //'/second': (context) => const PaginaProcedimento(),
        // '/three': (context) => const Cadastro(),
        // '/four': (context) => const Saiba_mais(),
        // '/five': (context) => const Agendamento(),
      },
    );
  }
}
