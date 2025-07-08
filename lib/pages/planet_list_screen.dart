import 'package:flutter/material.dart';
import 'package:maqueta_3/models/character_model.dart';
import 'package:maqueta_3/pages/character_detail_screen.dart';
import 'package:maqueta_3/services/api_service.dart';
import 'package:maqueta_3/widgets/mydrawer.dart';


class PlanetListScreen extends StatefulWidget {
  const PlanetListScreen({Key? key}) : super(key: key);

  @override
  State<PlanetListScreen> createState() => _PlanetListScreenState();
}

class _PlanetListScreenState extends State<PlanetListScreen> {
  //late Future<List<Character>> _futureCharacters;

  @override
  void initState() {
    super.initState();
    //_futureCharacters = ApiService().fetchAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes de Dragon Ball Z'),
      ),
      drawer: MyDrawer(),
      body: const Card(
        child: Text('Proximamente... Planetas'),
      )
      /*body: FutureBuilder<List<Character>>(
        future: _futureCharacters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No se encontraron personajes.'));
          } else {
            final characters = snapshot.data!;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(character.image),
                    ),
                    title: Text(character.name),
                    subtitle: Text(character.race),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterDetailScreen(character: character),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),*/
    );
  }
}
