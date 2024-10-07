import 'dart:convert';

class RoadMap {
    final List<Datum>? data;

    RoadMap({
        this.data,
    });

    factory RoadMap.fromRawJson(String str) => RoadMap.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RoadMap.fromJson(Map<String, dynamic> json) => RoadMap(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final String? title;
    final String? content;

    Datum({
        this.title,
        this.content,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
    };
}
