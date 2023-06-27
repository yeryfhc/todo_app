import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// ignore: must_be_immutable
class InputTextTodo extends ConsumerWidget{
  InputTextTodo({
    super.key, required this.labelText,
    required this.controller,
    required this.funtion
  });
   final String labelText;
   final VoidCallback funtion;
    TextEditingController controller;
  @override
  Widget build(BuildContext context,ref) {
    // final yery= ref.watch(saveTodoNote())
    return  Center(
      child: SizedBox(
        width: 300,
        child: TextField( 
          controller:controller,
          onEditingComplete: funtion,
        decoration: InputDecoration( labelText: labelText,labelStyle: const TextStyle(fontSize: 25) ),
         
        )),
    );
  }
}