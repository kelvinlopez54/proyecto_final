import 'package:flutter/material.dart';
import 'package:proyecto_final/Screens/tabs_screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harry el Potter',
      initialRoute: 'tabs',
      routes: {
        'tabs': (context) => TabsScreen(),
      },
    );
    //Hola papures...
  }
}