import 'package:marvel_characters/data/response_data.dart';

class Response {
  int? code;
  ResponseData? data;

  Response({this.code, this.data});

  Response.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    data = ResponseData.fromJson(json["data"]);
  }
}
