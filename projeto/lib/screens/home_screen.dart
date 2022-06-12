// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/diario_provider.dart';
import 'my_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var diarios = context.watch<DiarioProvider>().diarios;
    var myList = context.watch<DiarioProvider>().myList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Diarios'),
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
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MyListScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.favorite),
                label: Text(
                  "Lista de favoritos ${myList.length}",
                  style: const TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 243, 142, 26),
                    padding: const EdgeInsets.symmetric(vertical: 20)),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: diarios.length,
                    itemBuilder: (_, index) {
                      final currentDiario = diarios[index];
                      return Card(
                        key: ValueKey(currentDiario.data),
                        color: Color.fromARGB(255, 247, 196, 130),
                        elevation: 4,
                        child: ListTile(
                          title: Text(currentDiario.data),
                          subtitle:
                              Text(currentDiario.texto ?? 'Nenhuma informação'),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: myList.contains(currentDiario)
                                  ? Colors.red
                                  : Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              if (!myList.contains(currentDiario)) {
                                context
                                    .read<DiarioProvider>()
                                    .addToList(currentDiario);
                              } else {
                                context
                                    .read<DiarioProvider>()
                                    .removeFormList(currentDiario);
                              }
                            },
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/third');
        },
        child: const Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 255, 112, 67),
      ),
    );
  }
}
