import 'package:flutter/material.dart';

void main() => runApp(const TabsScreen());

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: const[

              TabBar(labelColor: Colors.black,tabs: [
                Tab(text: 'Personajasos',),
                Tab(text: 'Hechizasos',),
              ]),

          ]),
        ),
      ),
      
    );
  }

}
