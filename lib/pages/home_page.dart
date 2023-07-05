



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
      backgroundColor: const  Color(0xffc46832),
      
      drawer:   Drawer(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        semanticLabel: 'App Note ',
       backgroundColor: const Color(0xffc46832),
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
        
        backgroundColor: const  Color(0xffc46832)
      ),
      body:FutureBuilder(
        future: noteProvider.getNote(),
        builder: ((context, snapshot){
        if (snapshot.hasData){
          
              return  ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (((context, index) {
          TodoModel item= snapshot.data![index];     
                
           
        return Dismissible(key:UniqueKey(),
        
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
               noteProvider.deleteNoteID(item.id!);
              
            // log(item.id as num);
        } ,

        background: const  DismisibleDeleteIcon(),
        child: TheCardNote(
          funtioncheck:(v){
              
            
               noteProvider.boxchecke();
        
            
                  
        
          },note: item.note.toString(), title:item.title.toString(), ) );
      })));


          
        } else if(snapshot.hasError){
           
          return Center(child: Text(snapshot.error.toString()),);
           
        } else {
           
          return const Center(child: CircularProgressIndicator(),);
           
        } 
      }
      
      
      
       )) , floatingActionButton: FloatingActionButton( 
        backgroundColor: Colors.white,
        child: const Icon(Icons.add,color: Color(0xffc46832),size: 30,),
        onPressed: (){
         Navigator.pushNamed(context, 'NewNote');
        }),
   );
  }
}

class DismisibleDeleteIcon extends StatelessWidget {
  const DismisibleDeleteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(25)),
      
    child: const Center(child: Row(
    
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [Text('Delete',style: TextStyle(color: Colors.white,fontSize: 30),),Icon(Icons.delete,color: Colors.white,size: 30,)],),),);
  }
}





