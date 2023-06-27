import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class TheCardNote extends ConsumerWidget {
  const TheCardNote({
   required this.color,
    required this.note,
    required this.title,
    super.key,
  });
  final String title;
  final String note;
  final Color color;
  @override
  Widget build(BuildContext context,ref) {
   
  
    return Container( color: Colors.white,
      width: double.infinity,
      child:      Card(
        color: Colors.blueGrey,
        child: Column(
          mainAxisSize: MainAxisSize.max,

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(child: Text(title,style:const  TextStyle(fontSize: 30,color: Colors.white),)),
              const SizedBox(width: 100,),
                SizedBox(
                // color: Colors.red,
                width: 90,
                child:  Row(children: [const Text('Priority',style: TextStyle(fontSize: 20,color: Colors.white),),
                Icon(Icons.circle,color:color)],),
              )
            ],
          ),
           
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(note,style: const  TextStyle(fontSize: 20,color: Colors.white),),
          )
    
    
          ],)  ,),
    );
  }
}