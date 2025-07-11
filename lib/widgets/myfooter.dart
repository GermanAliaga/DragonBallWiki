import 'package:flutter/material.dart';
import 'package:dragonballwiki/pages/character_list_screen.dart';
import 'package:dragonballwiki/pages/planet_list_screen.dart';
import 'package:dragonballwiki/pages/preferences_screen.dart';
import 'package:dragonballwiki/pages/duel_screen.dart';
import 'package:dragonballwiki/pages/tournament_screen.dart';

class MyFooter extends StatefulWidget {
  const MyFooter({super.key});

  @override
  State<MyFooter> createState() => _MyFooterState();
}

class _MyFooterState extends State<MyFooter> {
  
  final List<Widget> navegacion = [
    CharacterListScreen(),
    PlanetListScreen(),
    PreferencePage(),
    DuelScreen(),
    TournamentScreen(),
  ];
  
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: 
     NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          indexSelected = index;
    
        });
      },
      selectedIndex: indexSelected,
      destinations: const <NavigationDestination>[        
        NavigationDestination(
          icon: Icon(Icons.person),
          label: 'Personajes',
        ),
        NavigationDestination(
          icon: Icon(Icons.public),
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
        NavigationDestination(
          icon: Icon(Icons.emoji_events),
          label: 'Torneo',
        ),
      ],
    ),
    body: navegacion[indexSelected],);
  }
}
