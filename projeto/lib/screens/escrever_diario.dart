import 'package:flutter/material.dart';

class PaginaEscrever extends StatefulWidget {
  const PaginaEscrever({Key? key}) : super(key: key);

  @override
  State<PaginaEscrever> createState() => _PaginaEscreverState();
}

final _formKey = GlobalKey<FormState>();
String? select_texto;
String? select_data;

final logo = Image.asset('images/diario.png');

class _PaginaEscreverState extends State<PaginaEscrever> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            // margin: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 83, 80, 239),
                Color.fromARGB(255, 120, 138, 240),
                Color.fromARGB(255, 180, 209, 243)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Center(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.all(4),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                ),
                SizedBox(
                  width: 130,
                  child: Column(
                    children: [
                      logo,
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                      ),
                      const Text(
                        'Diário Virtual',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      ),
                      const Text(
                        'Conte aqui, como foi seu dia',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 280),
                  child: const TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Escreva Seu texto',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Insira a Data',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Mostra o Popup
                    //
                  },
                  icon: const Icon(Icons
                      .save), //Icone que será utilizado dentro do elevated Button
                  label: const Text("Salvar"), //Texto dentro do botão
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent //Cor do Background do botão
                      ),
                ),
              ]),
            )));
  }
}