import 'package:flutter/material.dart';
import 'package:projeto/models/diarios.dart';
import 'package:provider/provider.dart';
import '../provider/diario_provider.dart';
import '../screens/home_screen.dart';

class FormularioWidget extends StatefulWidget {
  const FormularioWidget({Key? key}) : super(key: key);

  @override
  FormularioWidgetState createState() {
    return FormularioWidgetState();
  }
}

class FormularioWidgetState extends State<FormularioWidget> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController textodata = TextEditingController();
  TextEditingController textodiario = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: 'Nome do Filme'),
            controller: textodata,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Duração'),
            controller: textodiario,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
                child: const Text('Salvar'),
                onPressed: () {
                  Diario novodiario =
                      Diario(data: textodata.text, texto: textodiario.text);
                  context.read<DiarioProvider>().addToList2(novodiario);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
