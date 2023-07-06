import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_app/data/td_shareprefernce.dart';
import 'package:todo_app/pages/home_page.dart';

import 'pages/pages.dart';

void main()  async {

  WidgetsFlutterBinding.ensureInitialized();
   await TodoSharePreference.init();
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
      ), initialRoute: 'HomePage',
      routes: {
        'HomePage':(context) => const HomePage(),
        'NewNote':(context) => const NewNotePage(),
        'Trash':(context) => const TrashPage(),
      },
    
      
    );
  }
}