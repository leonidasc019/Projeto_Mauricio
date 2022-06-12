import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../authentication.dart';

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({Key? key}) : super(key: key);

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  final _formKey = GlobalKey<FormState>();
  final logo = Image.asset('images/diario_img_login.png');
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.deepOrange.shade400.withOpacity(1),
            Colors.orange.withOpacity(0.6),
            Colors.deepOrangeAccent.shade400.withOpacity(0.9)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 500,
              child: logo,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: TextFormField(
                      validator: (value) => EmailValidator.validate(value!)
                          ? null
                          : "Entre com email valido.",
                      onSaved: (value) {
                        email = value;
                      },
                      maxLines: 1,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(120, 90, 9, 9),
                        hintText: 'Entre com seu email.',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira sua senha';
                        }
                        return null;
                      },
                      maxLines: 1,
                      onSaved: (value) {
                        password = value;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(120, 90, 9, 9),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        hintText: 'Entre com a senha',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            AuthenticationHelper()
                                .signIn(email: email!, password: password!)
                                .then((result) {
                              if (result == null) {
                                Navigator.pushNamed(context, '/second');
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    result,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ));
                              }
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(17, 90, 9, 9),
                          onPrimary: const Color.fromARGB(255, 0, 0, 0),
                          padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                        ),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Divider(
                        thickness: 5,
                        color: Color.fromARGB(120, 90, 9, 9),
                        indent: 80,
                        endIndent: 80,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
