import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projeto/models/diarios.dart';

final List<Diario> initialData = List.generate(
    1,
    (index) => Diario(
        data: "12/06/2022 ",
        texto:
            "Hoje que as memórias se esvaem e os amigos fogem de mim só tenho minhas poesias como amigas confidentes mesmo assim impertinentes sem rima e vazias não inspiram a menor confiança: elas também me traem."));

class DiarioProvider extends ChangeNotifier {
  final List<Diario> _diarios = initialData;
  List<Diario> get diarios => _diarios;
  final List<Diario> _myList = [];
  List<Diario> get myList => _myList;

  void addToList2(Diario diario) {
    _diarios.add(diario);
    notifyListeners();
  }

  void addToList(Diario diario) {
    _myList.add(diario);
    notifyListeners();
  }

  void removeFormList(Diario diario) {
    _myList.remove(diario);
    notifyListeners();
  }
}
