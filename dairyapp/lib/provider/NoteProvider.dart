import 'package:dairyapp/model/model.dart';
import 'package:flutter/material.dart';

class Noteprovider extends ChangeNotifier {
  List<Model> list = [];

  void AddNote(Model model) {
    list.add(model);
    notifyListeners();
  }

  void update(Model model) {
    int indexOf = list.indexOf(
      list.firstWhere((model2) => model2.id == model.id),
    );
    list[indexOf] = model;
    notifyListeners();
  }

  void delete(Model model) {
    int indexOf = list.indexOf(
      list.firstWhere((model2) => model2.id == model.id),
    );
    list.removeAt(indexOf);
    notifyListeners();
  }
}
