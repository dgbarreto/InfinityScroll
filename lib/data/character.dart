import 'package:marvel_characters/data/thumbnail.dart';

class Character {
  int? id;
  String? name;
  String? description;
  Thumbnail? thumbnail;

  Character({this.id, this.name, this.description, this.thumbnail});

  Character.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    if (json["thumbnail"] != null) {
      thumbnail = Thumbnail.fromJson(json["thumbnail"]);
    }
  }
}
