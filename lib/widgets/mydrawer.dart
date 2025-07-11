import 'package:flutter/material.dart';
import 'package:dragonballwiki/pages/character_list_screen.dart';
import 'package:dragonballwiki/pages/planet_list_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(
          height: 125,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Text(
              'DragonBallWiki',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        ListTile(
          title: const Text('Personajes'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CharacterListScreen()));
          },
        ),
        ListTile(
          title: const Text('Planetas'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PlanetListScreen()));
          },
        ),
      ],
    ));
  }
}