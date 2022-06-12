// screens/my_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/diario_provider.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  _MyListScreenState createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<DiarioProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Lista (${_myList.length})"),
        backgroundColor: Color.fromARGB(255, 255, 112, 67),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 255, 112, 67),
            Color.fromARGB(255, 255, 152, 0),
            Color.fromARGB(255, 255, 61, 0)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: ListView.builder(
            itemCount: _myList.length,
            itemBuilder: (_, index) {
              final currentDiario = _myList[index];
              return Card(
                color: Color.fromARGB(255, 247, 196, 130),
                key: ValueKey(currentDiario.data),
                elevation: 4,
                child: ListTile(
                  title: Text(currentDiario.data),
                  subtitle: Text(currentDiario.texto ?? ''),
                  trailing: TextButton(
                    child: const Text(
                      'Excluir',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      context
                          .read<DiarioProvider>()
                          .removeFormList(currentDiario);
                    },
                  ),
                ),
              );
            }),
      ),
    );
  }
}
