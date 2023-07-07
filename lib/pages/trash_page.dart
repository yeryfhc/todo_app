





import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_app/pages/home_page.dart';

import '../model/todo_model.dart';
import '../provider/todo_app_ptovider.dart';
import '../widgets/widgets.dart';

class TrashPage extends ConsumerWidget {
const TrashPage({Key? key}) : super(key:key);
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
       
          
         ButtonDrawer(funcion:(){
          Navigator.push(context, PageTransition(child: const  HomePage(), type:PageTransitionType.topToBottom));
         }, icons: Icons.lightbulb, text: 'Notes',),
        //  ButtonDrawer(funcion:(){}, icons: Icons.alarm_sharp, text: 'Reminders',),
         ButtonDrawer(funcion:(){
          Navigator.push(context, PageTransition(child: const  TrashPage(), type:PageTransitionType.fade));
         }, icons: Icons.delete_outlined, text: 'Trash',),
         
          
       
         ],),
       ),

      ),
      appBar: AppBar( 
      
        title: const  Text('Trash', style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
       
        actions: const [Padding(
          padding: EdgeInsets.all(4.0),
          child: Image(image: AssetImage('assets/profile.png')),
        )],
        
        backgroundColor: const  Color(0xffc46832)
      ),
      body:FutureBuilder(
        future: noteProvider.getNoteTrash(),
        builder: ((context, snapshot){
        if (snapshot.hasData){
          
              return  ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (((context, index) {
          TodoModel item= snapshot.data![index];     
                
           
        return Dismissible(key:UniqueKey(),
        
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
               noteProvider.deleteNoteIDTRash(item.id!);
              
            // log(item.id as num);
        } ,

        background: const  DismisibleDeleteIcon(),
        child: TheCardNote(
          funtioncheck:(v){
              
            
            
               noteProvider.boxchecke();
        
            
                  
        
          },note: item.note.toString(), title:item.title.toString(), mikey: '${item.id}', ) );
      })));


          
        } else if(snapshot.hasError){
           
          return Center(child: Text(snapshot.error.toString()),);
           
        } else {
           
          return const Center(child: CircularProgressIndicator(),);
           
        } 
      }
      
      
      
       )) 
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





