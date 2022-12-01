
class CharacterInfo{
  String? name = "";
  String? house = "";
  bool? isStudent = false;
  String? actor = "";
  String? image = "";

  CharacterInfo({this.name,this.house,this.isStudent,this.actor,this.image});

  factory CharacterInfo.fromJson(Map<String, dynamic> json){
    return CharacterInfo(
      name: json["name"],
      house: json["house"],
      isStudent: json["hogwartsStudent"],
      actor: json["actor"],
      image: json["image"].replaceAll("herokuapp", "onrender")
    );
  }
}