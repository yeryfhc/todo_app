import 'package:flutter/material.dart';

class ButtonDrawer extends StatelessWidget {
 const  ButtonDrawer({ 
    super.key, required this.icons, required this.text, required this.funcion,
  });
 final VoidCallback funcion;
 final IconData icons;
 final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox( width: double.infinity,
     child: Padding(
       padding: const EdgeInsets.only(bottom:10 ),
       child: TextButton.icon(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
        
        onPressed: funcion, icon: Icon(icons,color: Colors.white,), label: Text(text,style: const  TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
     ));
  }
}