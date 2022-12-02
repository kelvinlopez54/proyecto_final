import 'package:flutter/material.dart';
import 'package:proyecto_final/DataClasses/CharacterInfo.dart';
import 'package:proyecto_final/DataClasses/SpellsInfo.dart';
import 'package:proyecto_final/Service/CharacterServiceBloc.dart';
import 'package:proyecto_final/Service/SpellsServiceBloc.dart';
void main() => runApp(const TabsScreen());

int tabPosition = 0;

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    CharacterServiceBloc characters = CharacterServiceBloc(); //Clase que descarga los datos del JSON de los personajes y te retorna una lista con los datos de cada personaje
    SpellsServiceBloc spells = SpellsServiceBloc(); //Clase que descarga los datos del JSON de los hechizos y te retorna una lista con el nombre y la descripción del hechizo.

    ScrollController CharacterScrollController = ScrollController(); //Controlar el scroll del tab de personajes.
    ScrollController SpellsScrollController = ScrollController(); //Controlar el scroll del tab de los hechizos.

    return DefaultTabController(
      length: 2, //Numero de tabs (Si te pasas dara error)...
      child: Scaffold(
        floatingActionButton: Column( //Se orden los floatingButtons verticalmente y agregar mas de un Floating...
          mainAxisAlignment: MainAxisAlignment.end, //Hacer hacia abajo los floatingButtons...

          children: [
        FloatingActionButton(
        onPressed: () {
            if (CharacterScrollController.hasClients && tabPosition == 0) { // Este if te sirve para saber en que tab te encuentras y desplazarlo...
              final position = CharacterScrollController.position.minScrollExtent; //Encuentra la posicion incial...           
              CharacterScrollController.animateTo(
                position,
                duration: Duration(seconds: 3),
                curve: Curves.easeOut,
              );
            }
            else if(SpellsScrollController.hasClients){
              final position = SpellsScrollController.position.minScrollExtent;
              SpellsScrollController.animateTo(
                position,
                duration: Duration(seconds: 3),
                curve: Curves.easeOut,
              );
            }
        },
        isExtended: true,
        tooltip: "Scroll to top", //Mensajito cuando dejas presionado...
        child: Icon(Icons.arrow_upward), // Flechita hacia arriba...
        ),
        SizedBox(height: 10), // Separacion entre botones...
        FloatingActionButton(
        onPressed: () {
            if (CharacterScrollController.hasClients && tabPosition == 0) {
              final position = CharacterScrollController.position.maxScrollExtent;
              CharacterScrollController.animateTo(
                position,
                duration: Duration(seconds: 3),
                curve: Curves.easeOut,
              );
            }
            else if(SpellsScrollController.hasClients){
              final position = SpellsScrollController.position.maxScrollExtent;
              SpellsScrollController.animateTo(
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
        body: SafeArea( // Omitir area ocupada por el hardware (Bocina de llamada, o camara o sensores)...
          child: Column(
            children: [
              TabBar(onTap: (int) { // Saber en que posicion se encuentra el usuario...
                tabPosition = int;
              },labelColor: Colors.black, tabs: [
                Tab(
                  text: 'Personajasos',
                ),
                Tab(
                  text: 'Hechizasos',
                ),
              ]),

              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                    controller: CharacterScrollController,
                    scrollDirection: Axis.vertical,
                    child: Container(
                        child: FutureBuilder<List<CharacterInfo>>(
                          future: characters.fetchCharacters(), // Obtener la lista de los datos de los personajes con el bloc...
                          builder: (context, snapshot) { // Construye la informacion siempre y cuando se anda concretado el future...
                          if(snapshot.hasData){ // Si se concreta el Future entonces que organice la informacion...
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
                                subtitle: Text(style: TextStyle(color: Colors.purple),"Gender: "+item.gender.toString()+"\n"+
                                "Date of birth: "+item.dateOfBirth.toString()+"\n"+
                                "Actor: "+item.actor.toString()),
                              ),
                            ),)).toList());
                          } else return CircularProgressIndicator();
                        },)),),

                        SingleChildScrollView(controller: SpellsScrollController,scrollDirection: Axis.vertical,child: Container(
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
}
