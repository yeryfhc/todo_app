
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/td_shareprefernce.dart';
import 'package:todo_app/provider/todo_app_ptovider.dart';

class CheckBoxTodo extends ConsumerWidget {
  const CheckBoxTodo({
    
    super.key,
  });

  @override
  Widget build(BuildContext context,ref) {
    final checkProvider=ref.watch(todoNoteProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(color:const  Color(0xffc46832),borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Priority',style: TextStyle( color :Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
            Checkbox(
              activeColor:const  Color(0xffc46832),
              
              value:checkProvider.boxchek , onChanged:(void ye){
                TodoSharePreference.readytd=false;
                checkProvider.boxchecke();
              
      
            } ),
          ],
        ),
      ),
    );
  }
}