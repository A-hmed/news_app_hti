class SourcesResponse {
  String? status;
  List<Source>? sources;
  String? message;
  String? code;

  SourcesResponse({
      this.status, 
      this.sources});

  SourcesResponse.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    code = json["code"];

    if (json["sources"] != null) {
      sources = [];
      json["sources"].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }

}

class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Source({
      this.id, 
      this.name, 
      this.description, 
      this.url, 
      this.category, 
      this.language, 
      this.country});

  Source.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    url = json["url"];
    category = json["category"];
    language = json["language"];
    country = json["country"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["description"] = description;
    map["url"] = url;
    map["category"] = category;
    map["language"] = language;
    map["country"] = country;
    return map;
  }

}