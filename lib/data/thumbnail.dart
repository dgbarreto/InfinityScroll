class Thumbnail {
  String? path;
  String? extension;
  static const portraitSmall = "portrait_small";
  static const stantardSmall = "standard_small";
  static const landscapeSmall = "landscape_small";

  Thumbnail({this.path, this.extension});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json["path"];
    extension = json["extension"];
  }

  String getUrl(String size) {
    return "${path ?? ""}/$size.${extension ?? ""}";
  }
}
