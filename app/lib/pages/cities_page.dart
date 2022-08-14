import 'package:app/entities/city.dart';
import 'package:flutter/material.dart';

class CitiesPage extends StatelessWidget {
  List<City> cities;
  CitiesPage({
    Key? key,
    required this.cities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of cities'),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cities[index].name),
            subtitle: Text(cities[index].geonameid),
          );
        },
      ),
    );
  }
}