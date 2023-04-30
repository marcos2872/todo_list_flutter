import 'package:flutter/material.dart';

class ViewFormController extends ChangeNotifier {
  static ViewFormController instance = ViewFormController();

  List todo = [];

  changeTodo(obj) {
    var newTodo = [...todo, obj];
    todo.clear();
    todo.addAll(newTodo.reversed);
    notifyListeners();
  }

  changeVerified(id) {
    var newTodo = [];
    todo.forEach((e) {
      if (e['id'] == id) {
        return newTodo.add({...e, 'verified': true});
      }
      return newTodo.add(e);
    });
    todo.clear();
    todo.addAll(newTodo);
    notifyListeners();
  }

  deletById(id) {
    var newTodo = [];
    todo.forEach((curr) {
      if (curr['id'] != id) {
        return newTodo.add(curr);
      }
      return;
    });
    todo.clear();
    todo.addAll(newTodo);
    notifyListeners();
  }
}
