import 'package:marvel_characters/data/character.dart';

class ResponseData {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Character>? character;

  ResponseData(
      {this.offset, this.limit, this.total, this.count, this.character});

  ResponseData.fromJson(Map<String, dynamic> json) {
    offset = json["offset"];
    limit = json["limit"];
    total = json["total"];
    count = json["count"];
    character = <Character>[];
    json["results"].forEach((e) => character!.add(Character.fromJson(e)));
  }
}
