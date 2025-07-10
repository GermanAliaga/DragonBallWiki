import 'package:flutter/material.dart';
import 'package:maqueta_3/models/character_model.dart';
import 'package:maqueta_3/models/planet_model.dart';
import 'package:maqueta_3/widgets/character_card.dart';
import 'package:maqueta_3/widgets/planet_card.dart';

class PlanetDetailScreen extends StatelessWidget {
  final Planet planeta;

  const PlanetDetailScreen({Key? key, required this.planeta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planeta.name),
      ),
      body: SingleChildScrollView(
        child: PlanetCard(planeta: planeta),
      ),
    );
  }
}
