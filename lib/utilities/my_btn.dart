// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String txt;
  VoidCallback onChanged;
  MyButton({super.key, required this.txt, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.yellow,
      onPressed: onChanged,
      child: Text(txt),
    );
  }
}
