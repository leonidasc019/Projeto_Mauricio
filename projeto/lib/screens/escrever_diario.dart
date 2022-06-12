import 'package:flutter/material.dart';
import 'package:projeto/provider/diario_provider.dart';
import 'package:provider/provider.dart';

import '../models/diarios.dart';
import 'home_screen.dart';

class PaginaEscrever extends StatefulWidget {
  const PaginaEscrever({Key? key}) : super(key: key);

  @override
  State<PaginaEscrever> createState() => _PaginaEscreverState();
}

final _formKey = GlobalKey<FormState>();
String? select_texto;
String? select_data;

TextEditingController textodata = TextEditingController();
TextEditingController textodiario = TextEditingController();

final logo = Image.asset('images/diario_img_login.png');

class _PaginaEscreverState extends State<PaginaEscrever> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            // margin: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 255, 112, 67),
                Color.fromARGB(255, 255, 152, 0),
                Color.fromARGB(255, 255, 61, 0)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Center(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.all(4),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                ),
                SizedBox(
                  width: 150,
                  child: Column(
                    children: [
                      logo,
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 5),
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
                  constraints: const BoxConstraints(maxHeight: 230),
                  child: TextFormField(
                    maxLines: null,
                    controller: textodiario,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Escreva Seu texto',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                ),
                TextFormField(
                  controller: textodata,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Insira a Data',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Diario novodiario =
                        Diario(data: textodata.text, texto: textodiario.text);
                    context.read<DiarioProvider>().addToList2(novodiario);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                  },
                  icon: const Icon(Icons
                      .save), //Icone que será utilizado dentro do elevated Button
                  label: const Text("Salvar"), //Texto dentro do botão
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 247, 196, 130),
                    onPrimary: const Color.fromARGB(255, 0, 0, 0),
                    //Cor do Background do botão
                  ),
                ),
              ]),
            )));
  }
}
