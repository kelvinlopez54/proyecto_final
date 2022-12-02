import 'package:flutter/material.dart';
import 'package:proyecto_final/Screens/tabs_screens.dart';

void main() => runApp(const MyApp()); //Selecciona a esta clase como la clase iniciadora de la app (main)...

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Quitar el debug banner de la esquina superior derecha...
      title: 'Harry el Potter', //Elegir titulo de la aplicación el cual aparece en la parte de arriba de la app...
      initialRoute: 'tabs', // Definir la ruta inicial (Que de esta clase vaya a la siguiente)...
      routes: { //Definir la ruta...
        'tabs': (context) => TabsScreen(), //Clase rooteada...
      },
    );
  }
}