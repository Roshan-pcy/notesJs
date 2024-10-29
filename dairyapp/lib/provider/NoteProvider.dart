import 'package:dairyapp/model/model.dart';
import 'package:dairyapp/services/Apiservice.dart';
import 'package:flutter/material.dart';

class Noteprovider extends ChangeNotifier {
  bool isloading = true;
  List<Model> list = [];
  Noteprovider() {
    fecthdata();
  }
  void AddNote(Model model) {
    list.add(model);
    notifyListeners();
    print(' Note provider called');
    ApiService.addNote(model);
  }

  void update(Model model) {
    int indexOf = list.indexOf(
      list.firstWhere((model2) => model2.id == model.id),
    );
    list[indexOf] = model;
    notifyListeners();
    ApiService.addNote(model);
  }

  void delete(Model model) {
    int indexOf = list.indexOf(
      list.firstWhere((model2) => model2.id == model.id),
    );
    list.removeAt(indexOf);
    notifyListeners();
    ApiService.delete(model);
  }

  void fecthdata() async {
    list = await ApiService.fectdata('mynewid');
    isloading = false;
    notifyListeners();
  }
}
