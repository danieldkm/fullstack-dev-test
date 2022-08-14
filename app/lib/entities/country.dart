import 'dart:convert';

import 'package:app/entities/subcountry.dart';

class Country {
  String name;
  List<Subcountry> subcountries;
  Country({
    required this.name,
    required this.subcountries,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'subcountries': subcountries.map((x) => x.toMap()).toList(),
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    print(map);
    return Country(
      name: map['name'] ?? '',
      subcountries: List<Subcountry>.from(map['subcountries']?.map((x) => Subcountry.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) => Country.fromMap(json.decode(source));
}
