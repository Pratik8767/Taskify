import 'package:flutter/material.dart';
import 'package:todo_list/ui/buttons.dart';
import 'package:todo_list/utils/const_widgets.dart';

// ignore: must_be_immutable
class DialogBox extends StatefulWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    ConstWidgets constWidgets = ConstWidgets();

    return AlertDialog(
      backgroundColor: Colors.white70,
      content: SizedBox(
          height: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            //used textfield for getting user input
            children: [
              TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Add new task",
                  hintStyle: constWidgets
                      .textWidget(
                          text: "Add new task",
                          fontSize: 16,
                          color: Colors.black)
                      .style,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(text: "Save", onPressed: widget.onSave),
                  const SizedBox(
                    width: 8,
                  ),
                  MyButton(text: "Cancel", onPressed: widget.onCancel),
                ],
              ),
            ],
          )),
    );
  }
}
