import 'package:flutter/material.dart';
import 'package:dragonballwiki/models/planet_model.dart';
import 'package:dragonballwiki/pages/planet_detail_screen.dart';
import 'package:dragonballwiki/services/api_service.dart';


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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Planetas de Dragon Ball Z'),
        leading: null,
      ),
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
