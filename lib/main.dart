import 'package:Discography/home_page.dart';
import 'package:Discography/listdossierpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Etude',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name?.startsWith('/listdossier') ?? false) {
          final uri = Uri.parse(settings.name!);
          final name = uri.queryParameters['name'];
          return MaterialPageRoute(builder: (_) => ListDossierPage(name: name));
        }
        return MaterialPageRoute(builder: (_) => HomePage());
      },
    );
  }
}
