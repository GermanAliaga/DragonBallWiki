import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maqueta_3/models/character_model.dart';
import 'package:maqueta_3/models/battle_result_model.dart';
import 'package:maqueta_3/pages/battle_result_screen.dart';
import 'package:maqueta_3/services/api_service.dart';
import 'package:maqueta_3/pages/tournament_screen.dart';
import 'package:maqueta_3/widgets/myfooter.dart';

class TournamentScreen extends StatefulWidget {
  const TournamentScreen({super.key});

  @override
  State<TournamentScreen> createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  List<Character> characters = [];
  Character? player;
  int round = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCharacters();
  }

  Future<void> loadCharacters() async {
    final all = await ApiService().fetchAllCharacters();
    all.shuffle(); // Para que sean aleatorios
    setState(() {
      characters = all.take(8).toList(); // 1 jugador + 7 rivales
      isLoading = false;
    });
  }

  Future<void> startTournament() async {
    if (player == null) return;

    List<Character> enemies = List.from(characters);
    enemies.remove(player);

    for (final enemy in enemies) {
      final result = BattleResult.simulate(player!, enemy);

      final bool won = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BattleResultScreen(
            character1: player!,
            character2: enemy,
            result: result,
            isArcadeMode: true,
          ),
        ),
      ) ?? false; 

      if (!won) {
        showGameOver();
        return;
      }

      setState(() => round++);
    }

    showWinner();
  }

  void showGameOver() async {
    // Restaurar orientación vertical
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('¡Derrota!'),
        content: const Text('Tu personaje fue derrotado. 😵‍💫'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Volver'),
          ),
        ],
      ),
    );
  }


  void showWinner() async {
    // Restaurar orientación vertical
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('¡Ganaste el torneo! 🎉'),
        content: Text('${player!.name} ha vencido a todos los rivales.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Volver'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Torneo - Modo Arcade')),
      bottomNavigationBar: MyFooter(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Selecciona tu personaje'),
            DropdownButton<Character>(
              value: player,
              hint: const Text('Tu personaje'),
              isExpanded: true,
              items: characters.map((c) {
                return DropdownMenuItem(
                  value: c,
                  child: Text(c.name),
                );
              }).toList(),
              onChanged: (value) => setState(() => player = value),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: player != null ? startTournament : null,
              child: const Text('Comenzar torneo'),
            ),
          ],
        ),
      ),
    );
  }
}
