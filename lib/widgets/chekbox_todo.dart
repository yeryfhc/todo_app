import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  const CheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Priority',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        Checkbox(value: true, onChanged:(void ye){
          

        } ),
      ],
    );
  }
}