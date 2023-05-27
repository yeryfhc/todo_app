

import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


class HomePage extends StatelessWidget {
const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const  Text('Todo App'),
        leading: DrawerButton(onPressed: (){
        
        },),
        actions: const [Padding(
          padding: EdgeInsets.all(4.0),
          child: Image(image: AssetImage('assets/profile.png')),
        )],
        
        backgroundColor: const Color.fromARGB(255, 255, 187, 0),
      ),
      body:   SizedBox(
        height: 800,
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
         showDialog(
        
          barrierColor: Colors.transparent,
          context: context, builder: (context) {
          return const  AddNote();

         } );
        }),
   );
  }
}



