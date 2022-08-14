import 'dart:convert';

import 'package:app/entities/city.dart';

class Subcountry {
  String name;
  List<City> cities;
  Subcountry({
    required this.name,
    required this.cities,
  });


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cities': cities.map((x) => x.toMap()).toList(),
    };
  }

  factory Subcountry.fromMap(Map<String, dynamic> map) {
    return Subcountry(
      name: map['name'] ?? '',
      cities: List<City>.from(map['cities']?.map((x) => City.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Subcountry.fromJson(String source) => Subcountry.fromMap(json.decode(source));
}
