import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get user => _auth.currentUser;

  Future<String?> agendamento({
    required String procedimento,
    required String data,
    required String hora,
    required String nome,
  }) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('agendamentos');
      await users.doc(_auth.currentUser!.uid).set({
        'nome': nome,
        'procedimento': procedimento,
        'data': data,
        'horario': hora
      });
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp({
    required String email,
    required String password,
    required String name,
    required String telefone,
  }) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      await _auth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((data) => {
                users.doc(data.user!.uid).set({
                  'name': name,
                  'telefone': telefone,
                  'email': email,
                  'senha': password
                })
              });

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //Login
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //Logout
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
