import 'package:flutter/material.dart';
import 'package:maqueta_3/pages/character_list_screen.dart';
import 'package:maqueta_3/pages/planet_list_screen.dart';
import 'package:maqueta_3/pages/preferences_screen.dart';
import 'package:maqueta_3/pages/duel_screen.dart';

class MyFooter extends StatefulWidget {
  const MyFooter({super.key});

  @override
  State<MyFooter> createState() => _MyFooterState();
}

class _MyFooterState extends State<MyFooter> {
  int currentPageIndex = 0;

  List<Widget> navegacion = [
    CharacterListScreen(),
    PlanetListScreen(),
    PreferencePage(),
    DuelScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navegacion[index]),
          );
        });
      },
      destinations: const <NavigationDestination>[
        NavigationDestination(
          icon: Icon(Icons.person),
          label: 'Personajes',
        ),
        NavigationDestination(
          icon: Icon(Icons.circle),
          label: 'Planetas',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings),
          label: 'Preferencias',
        ),
        NavigationDestination(
          icon: Icon(Icons.sports_martial_arts),
          label: 'Duelo',
        ),
      ],
    );
  }
}
