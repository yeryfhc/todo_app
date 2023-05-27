import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  const AddNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     bool check= false;
    return   Dialog(
      backgroundColor: const   Color.fromARGB(255, 255, 145, 0),
      child: Column(children:  [
       const  Center(child: Text('Add Note',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
      const Center(child: TextField()),
       Row( 
        mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
          const Text('Priority',style: TextStyle(fontSize: 20),),
           Checkbox(value:check , onChanged:(bool? check){} ),
         ],
       ),
      const  SizedBox(height: 50,),
       Row( 
        mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           TextButton(onPressed: (){},
            style: const ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.yellow) ), child: const  Text('Exit',style: TextStyle(color: Colors.white,fontSize: 25),),
           ),
           TextButton(onPressed: (){}, child: const  Text('Add',style: TextStyle(color: Colors.white,fontSize: 25))),

         ],
       ),


      ],),



    );
  }
}

void onchange(){}