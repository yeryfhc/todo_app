import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/provider/todo_app_ptovider.dart';


import '../widgets/widgets.dart';


class NewNotePage extends ConsumerWidget {
const NewNotePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,ref) {
    final textyery= TextEditingController();
    final textyery2= TextEditingController();
   final notesave=ref.watch(todoNoteProvider.notifier);
  
    return Scaffold(
      backgroundColor: Colors.yellow,
    appBar: AppBar( 
      backgroundColor: Colors.teal,
      centerTitle: true,
      title: const Text('New Note',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white),),),
      body:   Card(
        color: const  Color.fromARGB(132, 255, 235, 59),

        child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const  SizedBox(height: 50,),
         
         InputTextTodo(labelText: 'Title', controller: textyery,funtion: (){
          if (textyery.text.isNotEmpty&&textyery2.text.isNotEmpty) {
            notesave.saveNote(TodoModel(title: textyery.text,note: textyery2.text));
            Navigator.pop(context);
          }
         },),
         const SizedBox(height: 30,),
     
        InputTextTodo(labelText: 'Note', controller: textyery2,funtion: () async {
          // if (textyery2.text.isNotEmpty)  {
            
          
          // }
        },),
      const   SizedBox(height: 50,),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              color:  Colors.black12,
              borderRadius: BorderRadius.circular(10)),
            
            
            child: TextButton(onPressed: (){
                 if (textyery.text.isNotEmpty&&textyery2.text.isNotEmpty) {
                  notesave.saveNote(TodoModel(title: textyery.text,note: textyery2.text,priority: '1'));
                  Navigator.pop(context);
                }
            }, child: const  Text('Save',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
          ),const CheckBoxTodo(),
        ],
      ),
      
        

      ],),
      )
   );
  }
}



