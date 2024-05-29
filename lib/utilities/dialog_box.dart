// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todo_app/utilities/my_btn.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 200.0,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 22.0,
              ),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  hintText: 'Enter New Task',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  txt: "Save",
                  onChanged: onSave,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                MyButton(
                  txt: "Cancel",
                  onChanged: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
