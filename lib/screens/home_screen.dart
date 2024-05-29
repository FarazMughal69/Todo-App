import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utilities/dialog_box.dart';
import 'package:todo_app/utilities/todo_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // reference the hive box
  final _myBox = Hive.box('myBox');

  @override
  void initState() {
    //if this is first time opening the app
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      //if already data exist in the DataBase
      db.loadData();
    }
    super.initState();
  }

  //instance of DatabaseClass
  ToDoDatabase db = ToDoDatabase();

  // Text Controller
  final _controller = TextEditingController();

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.toDolst[index][1] = !db.toDolst[index][1];
    });
    db.updateTheDB();
  }

  void saveNewTask() {
    setState(() {
      db.toDolst.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateTheDB();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDolst.removeAt(index);
    });
    db.updateTheDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 2,
        shadowColor: Colors.black45,
        title: const Text('TODO'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15),
        child: ListView.builder(
          itemCount: db.toDolst.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: db.toDolst[index][0],
              isTaskComplete: db.toDolst[index][1],
              onChanged: (value) => checkboxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: createNewTask,
        child: const Icon(
          CupertinoIcons.add,
          color: Colors.black54,
        ),
      ),
    );
  }
}
