import 'package:flutter/material.dart';

class ViewFormController extends ChangeNotifier {
  static ViewFormController instance = ViewFormController();

  List<Map<String, String>> todo = [];

  changeTodo(obj) {
    todo.add(obj);
    notifyListeners();
  }
}
