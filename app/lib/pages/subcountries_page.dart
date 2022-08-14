import 'package:app/pages/cities_page.dart';
import 'package:flutter/material.dart';

import '../entities/subcountry.dart';

class SubCountriesPage extends StatelessWidget {
  List<Subcountry> subcountries;
  SubCountriesPage({
    Key? key,
    required this.subcountries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of subcountries'),
      ),
      body: ListView.builder(
        itemCount: subcountries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(subcountries[index].name),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => 
                CitiesPage(cities: subcountries[index].cities),
              ),
            ),
          );
        },
      ),
    );
  }
}