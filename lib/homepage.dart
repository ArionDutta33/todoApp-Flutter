import 'package:flutter/material.dart';
import 'package:todo/alert_dialog.dart';
import 'package:todo/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
  final _controller = TextEditingController();
//list of todo
  List todoList = [
    ["make tutorial", false],
    ["Code a app", false],
    ["take a walk", false],
    [" Eat a salad  ", false],
  ];
  //save task
  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void checkBoxChange(bool? value, int index) {
    setState(() {
      todoList[index][1] = value ?? true;
    });
  }

  void createTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertBox(
          onSave: saveNewTask,
          onCancel: () {
            Navigator.of(context).pop();
          },
          dialogController: _controller,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("Todo"),
        titleTextStyle: const TextStyle(
            fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        toolbarHeight: 80,
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(
            side: BorderSide(color: Color.fromARGB(255, 200, 200, 45))),
        backgroundColor: Colors.yellow,
        onPressed: () {
          createTask();
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return todoTile(
            delete: (p0) {
              deleteTask(index);
            },
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChange: (value) {
              checkBoxChange(value, index);
            },
          );
        },
      ),
    );
  }
}
