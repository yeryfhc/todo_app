
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/provider/todo_app_ptovider.dart';

class CheckBoxTodo extends ConsumerWidget {
  const CheckBoxTodo({
    
    super.key,
  });

  @override
  Widget build(BuildContext context,ref) {
    final checkProvider=ref.watch(todoNoteProvider);
    return Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Priority',style: TextStyle( color :Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
          Checkbox(
            activeColor: Colors.green,
            
            value:checkProvider.boxchek , onChanged:(void ye){
              checkProvider.boxchecke();
            
    
          } ),
        ],
      ),
    );
  }
}