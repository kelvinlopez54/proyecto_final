import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:proyecto_final/DataClasses/SpellsInfo.dart';

class SpellsService{
  Future<List<SpellsInfo>> fetchCharacters() async {

  List<SpellsInfo> spells = [];
  http.Response response = await http.get(Uri.parse("https://hp-api.onrender.com/api/spells"));
  
  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);
    spells = json.map<SpellsInfo>((item) => SpellsInfo.fromJson(item)).toList();
    /*
    Fluttertoast.showToast(
        msg: json[1]["name"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0

        import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
    );*/
    return spells;
  } else {
    return spells;
  }
}
}