import 'package:flutter/material.dart';
import 'package:maqueta_3/pages/character_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dragon Ball App',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const CharacterListScreen(),
    );
  }
}

