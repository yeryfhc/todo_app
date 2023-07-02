import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pages/pages.dart';

void main() {
  runApp( const ProviderScope(child:  MyApp()));
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
        primaryIconTheme:  const IconThemeData(color: Colors.white),
        useMaterial3: true,
        cardColor: Colors.white,
        primaryColor: const Color(0xfff88340)
      ), initialRoute: '/',
      routes: {
        '/':(context) => const HomePage(),
        'NewNote':(context) => const NewNotePage(),
      },
    
      
    );
  }
}