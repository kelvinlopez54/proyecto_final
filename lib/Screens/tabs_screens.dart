import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_final/DataClasses/CharacterInfo.dart';
import 'package:proyecto_final/DataClasses/SpellsInfo.dart';
import 'package:proyecto_final/Service/CharacterService.dart';
import 'package:proyecto_final/Service/SpellsService%20copy.dart';
void main() => runApp(const TabsScreen());

List<String> characters = ["Dinosaurio", "Dragon"];
List<String> spells = ["poder1", "poder2"];

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    CharacterService characters = CharacterService(); //Clase que descarga los datos del JSON de los personajes
    SpellsService spells = SpellsService(); //Clase que descarga los datos del JSON de los hechizos

    ScrollController listScrollController = ScrollController(); //Controlar el scroll del tab de personajes.

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          
          children: [
        FloatingActionButton(
        onPressed: () {
            if (listScrollController.hasClients) {
              final position = listScrollController.position.minScrollExtent;
              listScrollController.animateTo(
                position,
                duration: Duration(seconds: 3),
                curve: Curves.easeOut,
              );
            }
        },
        isExtended: true,
        tooltip: "Scroll to top",
        child: Icon(Icons.arrow_upward),
        ),
        FloatingActionButton(
        onPressed: () {
            if (listScrollController.hasClients) {
              final position = listScrollController.position.maxScrollExtent;
              listScrollController.animateTo(
                position,
                duration: Duration(seconds: 3),
                curve: Curves.easeOut,
              );
            }
        },
        isExtended: true,
        tooltip: "Scroll to bottom",
        child: Icon(Icons.arrow_downward),
        ),]),
        body: SafeArea(
          child: Column(
            children: [
              const TabBar(labelColor: Colors.black, tabs: [
                Tab(
                  text: 'Personajasos',
                ),
                Tab(
                  text: 'Hechizasos',
                ),
              ]),

              Expanded(
                child: TabBarView(
                  // Here is Line 132.
                  children: [
                    SingleChildScrollView(controller: listScrollController,scrollDirection: Axis.vertical,child: Container(
                        child: FutureBuilder<List<CharacterInfo>>(
                          future: characters.fetchCharacters(), 
                          builder: (context, snapshot) {
                          if(snapshot.hasData){
                            return Column(
                              children: snapshot.data!.map((item) => Container(
                              margin: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2), 
                            child: Card(
                              child: ListTile(
                                title: Text(item.name.toString()),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(item.image.toString()),
                                  ),
                                trailing: Text(item.house.toString()),
                              ),
                            ),)).toList());
                          } else return CircularProgressIndicator();
                        },)),),
                    
                    
                    SingleChildScrollView(scrollDirection: Axis.vertical,child: Container(
                        child: FutureBuilder<List<SpellsInfo>>(
                          future: spells.fetchCharacters(), 
                          builder: (context, snapshot) {
                          if(snapshot.hasData){
                            return Column(
                              children: snapshot.data!.map((item) => Container(
                              margin: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2), 
                            child: Card(
                              child: ListTile(
                                title: Text(item.name.toString()),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage("https://thumbs.dreamstime.com/b/mano-que-sostiene-una-varita-m%C3%A1gica-luz-brillante-m%C3%A1gica-con-las-chispas-76149425.jpg"),),
                                subtitle: Text(item.description.toString()),
                              ),
                            ),)).toList());
                          } else return CircularProgressIndicator();
                        },)),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void inicCharacters() {
    
  }
}

class Character{
  
}
