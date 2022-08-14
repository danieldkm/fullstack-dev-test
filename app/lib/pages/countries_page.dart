
import 'package:app/entities/country.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'subcountries_page.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  @override
  Widget build(BuildContext context) {
    final countries = FirebaseFirestore.instance.collection('countries')
      .withConverter<Country>(
        fromFirestore: (snapshots, _) => Country.fromMap(snapshots.data()!), 
        toFirestore: (country, _) =>country.toMap(),
      );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<QuerySnapshot<Country>>(
        stream: countries.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.requireData;

          return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index) => 
              ListTile(
                title: Text(data.docs[index].data().name),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubCountriesPage(subcountries: data.docs[index].data().subcountries,)),
                ),
              ),
          );
        },
      ),
    );
  }
}
