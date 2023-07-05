
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/td_shareprefernce.dart';



class TheCardNote extends ConsumerWidget {
  const TheCardNote({super.key, 
  required this.funtioncheck,


    required this.note,
    required this.title,
    
  });
  final String title;
  final String note;
  final Function(bool?) funtioncheck;
  
  @override
  Widget build(BuildContext context,ref) {
  //  final check=ref.watch(todoNoteProvider);
  
    return Container( 
    decoration: BoxDecoration(color: Colors.transparent,borderRadius: BorderRadius.circular(25)),
      width: double.infinity,
      child:      Card(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,


          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                // color: Colors.red,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  Text(title,style:const  TextStyle(fontSize: 30,color: Colors.black,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold),),
                  Text(note,style: const  TextStyle(fontSize: 20,color: Colors.black,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              const SizedBox(width: 50,),
                  


                SizedBox(
                //  color: Colors.green,
                width: 100,
                child:  Column(
                  mainAxisSize: MainAxisSize.min,
                  children:  [ const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child:  Text('Finish',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                  ), Checkbox.adaptive(value: TodoSharePreference.readytd, onChanged: funtioncheck)
],),
              )
            ],
          ),
           
          
          
    
    
          ],)  ,),
    );
  }
}