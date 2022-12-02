import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:proyecto_final/DataClasses/SpellsInfo.dart';

class SpellsServiceBloc{ //Bloc para obtener los hechizos...
  Future<List<SpellsInfo>> fetchCharacters() async { // Este bloc retorna un future...

    List<SpellsInfo> spells = [];
    http.Response response = await http.get(Uri.parse("https://hp-api.onrender.com/api/spells"));
    
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      spells = json.map<SpellsInfo>((item) => SpellsInfo.fromJson(item)).toList();
      return spells;
    } else {
      return spells;
    }
  }
}