import 'package:flutter/material.dart';
import 'package:maqueta_3/models/character_model.dart';
import 'package:maqueta_3/widgets/character_card.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: SingleChildScrollView(
        child: CharacterCard(character: character),
      ),
    );
  }
}
