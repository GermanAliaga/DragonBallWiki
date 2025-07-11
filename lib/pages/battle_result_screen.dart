import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maqueta_3/models/character_model.dart';
import 'package:maqueta_3/models/battle_result_model.dart';

class BattleResultScreen extends StatefulWidget {
  final Character character1;
  final Character character2;
  final BattleResult result;

  const BattleResultScreen({
    super.key,
    required this.character1,
    required this.character2,
    required this.result,
  });

  @override
  State<BattleResultScreen> createState() => _BattleResultScreenState();
}

class _BattleResultScreenState extends State<BattleResultScreen> {
  @override
  void initState() {
    super.initState();
    // Forzamos orientación horizontal al entrar
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    // Restauramos orientación vertical al salir
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String bck_image = 'assets/images/torneo.png';
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildFighter(widget.character1),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'VS',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Ganador:',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  widget.result.winner,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent),
                ),
              ],
            ),
            _buildFighter(widget.character2),
          ],
        ),
      ),
    );
  }

  Widget _buildFighter(Character c) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(c.image, height: 200),
        const SizedBox(height: 10),
        Text(
          c.name,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}
