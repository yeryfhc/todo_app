import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  const AddNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     bool check= false;
    return   Dialog(
      backgroundColor:   Color.fromARGB(255, 255, 145, 0),
      child: Column(children:  [
       const  Center(child: Text('Add Note',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
      const Center(child: TextField()),
       Checkbox(value:check , onChanged:(bool? check){} ),


      ],),



    );
  }
}

void onchange(){}