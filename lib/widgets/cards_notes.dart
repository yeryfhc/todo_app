import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class TheCardNote extends ConsumerWidget {
  const TheCardNote({super.key, 


    required this.note,
    required this.title,
    
  });
  final String title;
  final String note;
  
  @override
  Widget build(BuildContext context,ref) {
   
  
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
              Column(
                children: [
                  Center(child: Text(title,style:const  TextStyle(fontSize: 30,color: Colors.black,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold),)),
                 Text(note,style: const  TextStyle(fontSize: 20,color: Colors.black,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold))
                ],
              ),
              const SizedBox(width: 100,),
                  


                SizedBox(
                // color: Colors.red,
                width: 90,
                child:  Column(
                  mainAxisSize: MainAxisSize.min,
                  children:  [ const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child:  Text('Priority',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                  ),
                Switch.adaptive(
                 activeColor: const Color(0xffc46832),
                  
                  
                  value: true, onChanged: (v){
                  return;
                })],),
              )
            ],
          ),
           
          
          
    
    
          ],)  ,),
    );
  }
}