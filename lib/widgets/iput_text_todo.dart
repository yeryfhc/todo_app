import 'package:flutter/material.dart';

class InputTextTodo extends StatelessWidget {
  const InputTextTodo({
    super.key, required this.labelText,
  });
   final String labelText;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        width: 300,
        child: TextField(
        decoration: InputDecoration( labelText: labelText,labelStyle: const TextStyle(fontSize: 25) ),
         
        )),
    );
  }
}