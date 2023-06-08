

import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


class HomePage extends StatelessWidget {
const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:   Drawer(
        semanticLabel: 'App Note',
       backgroundColor: Colors.amber,
       child: Padding(
         padding: const  EdgeInsets.all(8.0),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
              const  SizedBox(height: 20,),
             const  Center(child:   Text('App Note',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)),
              const   SizedBox(height: 20,),
       
          
         ButtonDrawer(funcion:(){}, icons: Icons.lightbulb, text: 'Notes',),
         ButtonDrawer(funcion:(){}, icons: Icons.alarm_sharp, text: 'Reminders',),
         ButtonDrawer(funcion:(){}, icons: Icons.delete_outlined, text: 'Trash',),
         
          
       
         ],),
       ),


      ),
      appBar: AppBar( 
      
        title: const  Text('Todo App'),
       
        actions: const [Padding(
          padding: EdgeInsets.all(4.0),
          child: Image(image: AssetImage('assets/profile.png')),
        )],
        
        backgroundColor: const Color.fromARGB(255, 255, 187, 0),
      ),
      body:   SizedBox(
            height: double.infinity,
            child: ListView.builder(
       
       itemCount: 15,
       itemBuilder: (BuildContext context, int index) {
         return  const TheCardNote() ;
       },
            ),
          ), floatingActionButton: FloatingActionButton( 
        backgroundColor: const  Color.fromARGB(255, 255, 145, 0),
        child: const Icon(Icons.add),
        onPressed: (){
         Navigator.pushNamed(context, 'NewNote');
        }),
   );
  }
}





