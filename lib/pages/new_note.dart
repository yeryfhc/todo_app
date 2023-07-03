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
      backgroundColor:const Color(0xffc46832),
    appBar: AppBar( 
      backgroundColor: const Color(0xffc46832),
      centerTitle: true,
      title: const Text('New Note',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white),),),
      body:   Card(
        color: Colors.white,

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
      const   SizedBox(height: 40,),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonSaveAndBack( notesave: notesave,text: 'Save', funtion: (){
            if (textyery.text.isNotEmpty&&textyery2.text.isNotEmpty) {
          notesave.saveNote(TodoModel(title: textyery.text,note: textyery2.text,));
          Navigator.pop(context);
        }
          },),
          ButtonSaveAndBack(notesave: notesave,text: 'Back',funtion: (){
          Navigator.pop(context);
          },),
        ],
      ),
      
        

      ],),
      )
   );
  }
}

class ButtonSaveAndBack extends StatelessWidget {
  const ButtonSaveAndBack({

    super.key,
    required this.text,
   
    required this.notesave, required this.funtion,
  });
final VoidCallback funtion;

  final TodoNoteNotifier notesave;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xffc46832)),
        elevation: MaterialStateProperty.all(20),side: MaterialStateProperty.all(const BorderSide(color: Colors.white))),
      onPressed: funtion , child:  Text(text,style: const  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),));
  }
}



