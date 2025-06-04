import 'package:flutter/material.dart';

class ListDossierPage extends StatelessWidget {
  final String? name;

  const ListDossierPage({this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liste des Dossiers')),
      body: Center(
        child:
            name != null
                ? Text('Recherche: $name', style: TextStyle(fontSize: 24))
                : Text('Tous les dossiers', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
