
class CharacterInfo{
  String? name = "";
  String? house = "";
  String? gender = "";
  String? dateOfBirth = "";
  String? actor = "";
  String? image = "";

  CharacterInfo({this.name,this.house,this.gender,this.dateOfBirth,this.actor, this.image});

  factory CharacterInfo.fromJson(Map<String, dynamic> json){
    return CharacterInfo(
      name: json["name"],
      house: json["house"],
      gender: json["gender"],
      dateOfBirth: json["dateOfBirth"],
      actor: json["actor"],
      image: json["image"].replaceAll("herokuapp", "onrender")
    );
  }
}