import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:proyecto_final/DataClasses/CharacterInfo.dart';

class CharacterServiceBloc{ //Bloc para obtener los datos de los personajes...
  Future<List<CharacterInfo>> fetchCharacters() async {

  List<CharacterInfo> characters = [];
  http.Response response = await http.get(Uri.parse("https://hp-api.onrender.com/api/characters"));
  
  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);
    characters = json.map<CharacterInfo>((item) => CharacterInfo.fromJson(item)).toList();
    return characters;
  } else {
    return characters;
  }
}
}