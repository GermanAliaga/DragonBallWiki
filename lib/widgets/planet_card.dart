import 'package:flutter/material.dart';
import 'package:maqueta_3/models/planet_model.dart';

class PlanetCard extends StatelessWidget {
  final Planet planeta;

  const PlanetCard({Key? key, required this.planeta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              planeta.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                planeta.image,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            /*const SizedBox(height: 16),
            Text('Raza: ${character.race}'),
            Text('Género: ${character.gender}'),
            Text('Afiliación: ${character.affiliation}'),
            Text('Ki: ${character.ki}'),
            Text('Ki Máximo: ${character.maxKi}'),
            const SizedBox(height: 16),*/
            Text(
              planeta.description,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
