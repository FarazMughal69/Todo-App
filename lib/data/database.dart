import 'package:hive/hive.dart';

class ToDoDatabase {
  //todo list
  List toDolst = [];

  // reference our box
  final _myBox = Hive.box('myBox');

  // run this method if the app is running for the first time
  void createInitialData() {
    toDolst = [
      ['This is Default tasks', true],
      ['Do Exercise', false],
    ];
  }

  //Load the Data from database
  void loadData() {
    toDolst = _myBox.get('TODOLIST');
  }

  // Update the dataBase
  void updateTheDB() {
    _myBox.put('TODOLIST', toDolst);
  }

  //Delete a recoed from dataBase
  void deleteRecord() {
    // _myBox.delete(key)
  }
}
