import 'package:flutter/material.dart';

import 'pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: 'Todo APp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), initialRoute: '/',
      routes: {
        '/':(context) => const HomePage()
      },
    
      
    );
  }
}