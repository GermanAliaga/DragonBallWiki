import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dragonballwiki/models/character_model.dart';
import 'package:dragonballwiki/widgets/character_card.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({Key? key, required this.character}) : super(key: key);

  Future<void> _shareCharacter(BuildContext context) async {
    try {
      // Descargar imagen desde URL
      final response = await http.get(Uri.parse(character.image));
      if (response.statusCode != 200) throw Exception("No se pudo descargar la imagen");

      final bytes = response.bodyBytes;

      // Obtener carpeta temporal
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/${character.name.replaceAll(" ", "_")}.jpg');

      // Guardar archivo
      await file.writeAsBytes(bytes);

      // Compartir con imagen y texto
      await Share.shareXFiles(
        [XFile(file.path)],
        text: 'Mira a ${character.name}, un personaje de Dragon Ball Z!\n'
              'Raza: ${character.race}\nAfiliación: ${character.affiliation}\n'
              'Planeta: ${character.originPlanet.name}',
      );
    } catch (e) {
      // Si falla, compartir solo el texto
      await Share.share(
        'Mira a ${character.name}, un personaje de Dragon Ball Z!\n'
        'Raza: ${character.race}\nAfiliación: ${character.affiliation}\n'
        'Planeta: ${character.originPlanet.name}',
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo compartir la imagen, se compartió solo texto.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(character.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _shareCharacter(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: CharacterCard(character: character),
      ),
    );
  }
}
