

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_app/model/todo_model.dart';

import 'package:todo_app/provider/todo_app_ptovider.dart';



import '../widgets/widgets.dart';


class HomePage extends ConsumerWidget {
const HomePage({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context ,ref) {
    final noteProvider= ref.watch(todoNoteProvider);
     
  
    return Scaffold(
      drawer:   Drawer(
        semanticLabel: 'App Note ',
       backgroundColor: Colors.teal.shade400,
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
      
        title: const  Text('Todo App', style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
       
        actions: const [Padding(
          padding: EdgeInsets.all(4.0),
          child: Image(image: AssetImage('assets/profile.png')),
        )],
        
        backgroundColor:  Colors.tealAccent
      ),
      body:FutureBuilder(
        future: noteProvider.getNote(),
        builder: ((context, snapshot){
        if (snapshot.hasData){
              return  ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (((context, index) {

                TodoModel item= snapshot.data![index];
             int? id=item.id;
        return Dismissible(key: UniqueKey(),
        onDismissed: (direction) {
               noteProvider.deleteNoteID(id!);
            print(id);
        } ,

        background: Container(color: Colors.red,),
        child: TheCardNote(note: item.note.toString(), title:item.title.toString(),color: Colors.black,));
      })));


          
        } else {
           
          return const Center(child: CircularProgressIndicator(),);
           
        } 
      }
      
      
      
       )) , floatingActionButton: FloatingActionButton( 
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add,color: Colors.white,size: 30,),
        onPressed: (){
         Navigator.pushNamed(context, 'NewNote');
        }),
   );
  }
}





