import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:proyecto_final/DataClasses/CharacterInfo.dart';

class CharacterService{
  Future<List<CharacterInfo>> fetchCharacters() async {

  List<CharacterInfo> characters = [];
  http.Response response = await http.get(Uri.parse("https://hp-api.onrender.com/api/characters"));
  
  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);
    characters = json.map<CharacterInfo>((item) => CharacterInfo.fromJson(item)).toList();
    /*
    Fluttertoast.showToast(
        msg: json[1]["name"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );*/
    return characters;
  } else {
    return characters;
  }
}
}