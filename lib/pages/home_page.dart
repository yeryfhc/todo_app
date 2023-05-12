
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
      body:   SingleChildScrollView(
        child: 
          ListView.builder(
            
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return  const TheCardNote() ;
            },
          ),
        
      ), floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.ad_units),
        onPressed: (){
         

        }),
   );
  }
}

