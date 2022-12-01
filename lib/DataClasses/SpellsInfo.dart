class SpellsInfo{
  String? name = "";
  String? description = "";

  SpellsInfo({this.name,this.description});

  factory SpellsInfo.fromJson(Map<String, dynamic> json){
    return SpellsInfo(
      name: json["name"],
      description: json["description"],
    );
  }
}