import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harry el Potter',
      initialRoute: 'tabs',
      routes: {
        'tabs': (context) => TabsScreen(),
      },
    );
  }
}