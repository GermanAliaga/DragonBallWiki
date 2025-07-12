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

  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadCharacters();
  }

  Future<void> loadCharacters() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final all = await ApiService().fetchAllCharacters();
      setState(() {
        characters = all;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'No se pudo cargar la lista de personajes.';
      });
    }
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
        title: const Text('Duelo de Personajes'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.wifi_off, size: 60, color: Colors.red),
                      const SizedBox(height: 12),
                      Text(
                        'Sin conexión a Internet.\n$errorMessage',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: loadCharacters,
                        child: const Text('Reintentar'),
                      ),
                    ],
                  ),
                )
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
