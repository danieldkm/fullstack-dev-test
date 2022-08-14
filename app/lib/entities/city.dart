import 'dart:convert';

class City {
  String name;
  String geonameid;
  City({
    required this.name,
    required this.geonameid,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'geonameid': geonameid,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      name: map['name'] ?? '',
      geonameid: map['geonameid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) => City.fromMap(json.decode(source));
}
