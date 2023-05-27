import 'package:flutter/material.dart';

class TheCardNote extends StatelessWidget {
  const TheCardNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container( color: Colors.white,
      width: double.infinity,
      child:   const  Card(
        color: Colors.yellow,
        child:Column(
          mainAxisSize: MainAxisSize.max,

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(child: Text('Title',style: TextStyle(fontSize: 30),)),
              SizedBox(width: 100,),
              SizedBox(
                // color: Colors.red,
                width: 90,
                child:  Row(children: [Text('Priority',style: TextStyle(fontSize: 20),),
                Icon(Icons.circle,color: Colors.green,)],),
              )
            ],
          ),
           
          
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('This is the real note for you ',style: TextStyle(fontSize: 20),),
          )
    
    
          ],)  ,),
    );
  }
}