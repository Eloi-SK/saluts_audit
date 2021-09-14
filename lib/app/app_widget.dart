import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        Locale('pt', 'BR')
      ],
      title: 'Salutis Audit',
      theme: ThemeData(primarySwatch: Colors.pink),
    ).modular();
  }
}