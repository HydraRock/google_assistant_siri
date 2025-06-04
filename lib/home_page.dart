import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Etude')),
      body: Center(child: Text('Benvenuto nella home di Etude')),
    );
  }
}
