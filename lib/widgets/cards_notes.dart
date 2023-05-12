import 'package:flutter/material.dart';

class TheCardNote extends StatelessWidget {
  const TheCardNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child:  Card(
        child:Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
           Text('Title', style: TextStyle(fontSize: 30),), 
           SizedBox(width: 300,),
          Icon(Icons.circle,color: Colors.green,)

            ],),

          
          Text('this is the real note for you',style: TextStyle(fontSize: 20),)
    
    
          ],)  ,),
    );
  }
}