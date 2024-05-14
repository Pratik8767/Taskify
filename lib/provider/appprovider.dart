import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier {
  List<bool> isVisible = List.filled(2, true);

  void toggleVisibility(int index) {
    isVisible[index] = !isVisible[index];
    notifyListeners();
  }

  final List<List<dynamic>> _todoList = [
    ["Go To GYM", false],
    // ["Go and Code", false]
  ];

  List<List<dynamic>> get todoList => _todoList;

  void checkBoxChanged(int index) {
    _todoList[index][1] = !_todoList[index][1];
    notifyListeners();
  }

  void saveNewTask(String task) {
    _todoList.add([task, false]);
    notifyListeners();
  }

  void deleteTask(int index) {
    _todoList.removeAt(index);
    notifyListeners();
  }
}
