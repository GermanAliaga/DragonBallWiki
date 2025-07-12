import 'package:flutter/material.dart';
import 'package:dragonballwiki/models/character_model.dart';
import 'package:dragonballwiki/models/battle_result_model.dart';
import 'package:dragonballwiki/pages/battle_result_screen.dart';
import 'package:dragonballwiki/services/api_service.dart';

class DuelScreen extends StatefulWidget {
  const DuelScreen({super.key});

  @override
  State<DuelScreen> createState() => _DuelScreenState();
}

class _DuelScreenState extends State<DuelScreen> {
  List<Character> characters = [];
  Character? selected1;
  Character? selected2;
  BattleResult? result;

  @override
  void initState() {
    super.initState();
    loadCharacters();
  }

  Future<void> loadCharacters() async {
    final all = await ApiService().fetchAllCharacters();
    setState(() {
      characters = all;
    });
  }

  void simulate() {
    if (selected1 != null && selected2 != null) {
      final r = BattleResult.simulate(selected1!, selected2!);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BattleResultScreen(
            character1: selected1!,
            character2: selected2!,
            result: r,
          ),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Duelo de Personajes')),
      //bottomNavigationBar: MyFooter(),
      body: characters.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  DropdownButton<Character>(
                    hint: const Text('Selecciona luchador 1'),
                    value: selected1,
                    isExpanded: true,
                    items: characters.map((c) {
                      return DropdownMenuItem(
                        value: c,
                        child: Text(c.name),
                      );
                    }).toList(),
                    onChanged: (value) => setState(() => selected1 = value),
                  ),
                  DropdownButton<Character>(
                    hint: const Text('Selecciona luchador 2'),
                    value: selected2,
                    isExpanded: true,
                    items: characters.map((c) {
                      return DropdownMenuItem(
                        value: c,
                        child: Text(c.name),
                      );
                    }).toList(),
                    onChanged: (value) => setState(() => selected2 = value),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: simulate,
                    child: const Text('¡Simular duelo!'),
                  ),
                  const SizedBox(height: 20),
                  if (result != null)
                    Column(
                      children: [
                        Text(
                          result!.summary,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text('Ganador: ${result!.winner}'),
                      ],
                    ),
                ],
              ),
            ),
    );
  }
}
