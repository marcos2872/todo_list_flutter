import 'package:flutter/material.dart';

class ViewFormController extends ChangeNotifier {
  static ViewFormController instance = ViewFormController();

  List todo = [];

  changeTodo(obj) {
    todo.add(obj);
    notifyListeners();
  }

  changeVerified(id) {
    var newTodo = [];
    todo.forEach((e) {
      if (e['id'] == id) {
        return newTodo.add({...e, 'verified': !e['verified']});
      }
      return newTodo.add(e);
    });
    todo.clear();
    todo.addAll(newTodo);
    notifyListeners();
  }
}
