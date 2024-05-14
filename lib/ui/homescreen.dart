import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/ui/dialogue.dart';
import 'package:todo_list/authentication/login.dart';
import 'package:todo_list/provider/appprovider.dart';
import 'package:todo_list/ui/to-do-tile.dart';

import '../utils/const_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => LogIn()));
  }

  @override
  Widget build(BuildContext context) {
    final constWidgets = ConstWidgets();
    AppProvider appProvider = Provider.of<AppProvider>(context);

    void saveNewTask() {
      appProvider.saveNewTask(controller.text);
      controller.clear();

      Navigator.of(context).pop();
    }

    void createNewTask() {
      showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        },
      );
    }
    //to creating new task while tapping onn plus button

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade900.withOpacity(0.7),
          automaticallyImplyLeading: false,
          title: constWidgets.logoTextWidget(
              text: "Taskify", fontSize: 25, color: Colors.white),
          actions: [
            IconButton(
                onPressed: () {
                  logOut();
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: Colors.white.withOpacity(0.7),
          child: const Icon(
            Icons.add,
            color: Colors.deepPurple,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.grey.shade200),
          child: ListView.builder(
            itemCount: appProvider.todoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskname: appProvider.todoList[index][0],
                taskCompleted: appProvider.todoList[index][1],
                onChanged: (value) => appProvider.checkBoxChanged(index),
                deleteFunction: (context) => appProvider.deleteTask(index),
              );
            },
          ),
        ));
  }
}
