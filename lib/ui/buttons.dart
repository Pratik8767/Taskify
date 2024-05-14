import 'package:flutter/material.dart';
import 'package:todo_list/utils/const_widgets.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    ConstWidgets constWidgets = ConstWidgets();
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.deepPurple.shade500.withOpacity(0.7)
          // const Color.fromARGB(255, 26, 20, 64), // background color
          ),
      child: constWidgets.textWidget(
        text: text,
        fontSize: 14,
        color: Colors.white,
      ),
    );
  }
}
