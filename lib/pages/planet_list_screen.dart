import 'package:flutter/material.dart';
import 'package:maqueta_3/models/character_model.dart';
import 'package:maqueta_3/models/planet_model.dart';
import 'package:maqueta_3/pages/character_detail_screen.dart';
import 'package:maqueta_3/pages/planet_detail_screen.dart';
import 'package:maqueta_3/services/api_service.dart';
import 'package:maqueta_3/widgets/mydrawer.dart';


class PlanetListScreen extends StatefulWidget {
  const PlanetListScreen({Key? key}) : super(key: key);

  @override
  State<PlanetListScreen> createState() => _PlanetListScreenState();
}

class _PlanetListScreenState extends State<PlanetListScreen> {
  late Future<List<Planet>> _futurePlanets;

  @override
  void initState() {
    super.initState();
    _futurePlanets = ApiService().fetchAllPlanets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planetas de Dragon Ball Z'),
      ),
      drawer: MyDrawer(),
      body: FutureBuilder<List<Planet>>(
        future: _futurePlanets,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No se encontraron planetas.'));
          } else {
            final planets = snapshot.data!;
            return ListView.builder(
              itemCount: planets.length,
              itemBuilder: (context, index) {
                final planeta = planets[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(planeta.image),
                    ),
                    title: Text(planeta.name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlanetDetailScreen(planeta: planeta),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
