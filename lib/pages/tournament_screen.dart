import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dragonballwiki/models/character_model.dart';
import 'package:dragonballwiki/models/battle_result_model.dart';
import 'package:dragonballwiki/pages/battle_result_screen.dart';
import 'package:dragonballwiki/services/api_service.dart';

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
      all.shuffle(); // Para aleatoriedad
      setState(() {
        characters = all.take(8).toList(); // 1 jugador + 7 rivales
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'No se pudo cargar la lista de personajes.';
      });
    }
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Torneo - Modo Arcade'),
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
