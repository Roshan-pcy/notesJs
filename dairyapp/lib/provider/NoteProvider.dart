import 'package:dairyapp/model/model.dart';
import 'package:flutter/material.dart';

class Noteprovider extends ChangeNotifier {
  List<Model> list = [];

  void AddNote(Model model) {
    list.add(model);
    notifyListeners();
  }

  void AddDelete(int index) {
    list.remove(index);
    notifyListeners();
  }

  void UpdateData(Model model) {
    list.add(model);
    notifyListeners();
  }
}
