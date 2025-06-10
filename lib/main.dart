import 'package:Discography/home_page.dart';
import 'package:Discography/listdossierpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const _channel = MethodChannel('fr.discography.voice/intent');
  final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'navigate') {
        final route = call.arguments as String?;
        if (route != null) {
          _navKey.currentState?.pushNamed(route);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Etude',
      navigatorKey: _navKey,
      initialRoute: WidgetsBinding.instance.platformDispatcher.defaultRouteName,
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
