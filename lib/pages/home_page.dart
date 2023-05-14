

import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


class HomePage extends StatelessWidget {
const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        leading: DrawerButton(onPressed: (){
        
        },),
        actions: const [Padding(
          padding: EdgeInsets.all(4.0),
          child: Image(image: AssetImage('assets/profile.png')),
        )],
        
        backgroundColor: const Color.fromARGB(79, 158, 158, 158),
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
        child: const Icon(Icons.ad_units),
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

class AddNote extends StatelessWidget {
  const AddNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  const Stack(
    
         children: [
     Center(
       child: SizedBox(
        width: double.infinity,
        height: 300,
         child: Card(
          margin: EdgeInsets.all(10),
          color: Color.fromARGB(220, 246, 255, 0),
           child: Column(children: [
             Text('Add Note',style: TextStyle(color: Colors.deepPurple,fontSize: 30,fontWeight: FontWeight.bold),),
            TextField(
            decoration: InputDecoration(
                hintText: 'Title',
              disabledBorder: InputBorder.none)

            )
           
           ],),
         ),
       ),
     )

         ],
  
    );
  }
}

