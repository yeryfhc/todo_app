import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


class NewNotePage extends StatelessWidget {
const NewNotePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
    appBar: AppBar( 
      backgroundColor: const  Color.fromARGB(255, 255, 145, 0),
      centerTitle: true,
      title: const Text('New Note',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
      body: const   Card(
        color:  Color.fromARGB(132, 255, 235, 59),

        child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(height: 50,),
         
         InputTextTodo(labelText: 'Title',),
         SizedBox(height: 30,),
     
        InputTextTodo(labelText: 'Note',),
       SizedBox(height: 50,),
        CheckBoxTodo(),

      ],),
      )
   );
  }
}



