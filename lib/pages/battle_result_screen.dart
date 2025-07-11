import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maqueta_3/models/character_model.dart';
import 'package:maqueta_3/models/battle_result_model.dart';

class BattleResultScreen extends StatefulWidget {
  final Character character1;
  final Character character2;
  final BattleResult result;
  final bool isArcadeMode;

  const BattleResultScreen({
    super.key,
    required this.character1,
    required this.character2,
    required this.result,
    this.isArcadeMode = false,
  });

  @override
  State<BattleResultScreen> createState() => _BattleResultScreenState();
}

class _BattleResultScreenState extends State<BattleResultScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    if (!widget.isArcadeMode) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String bck_image = 'assets/images/torneo.png';

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(bck_image, fit: BoxFit.cover),
          ),
          Column(
            children: [
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFighter(widget.character1),
                  Column(
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
                      const Text(
                        'Ganador:',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        widget.result.winner,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent,
                        ),
                      ),
                      const SizedBox(height: 20),
                          if (widget.isArcadeMode)
                            ElevatedButton(
                              onPressed: () async {
                                await SystemChrome.setPreferredOrientations([
                                  DeviceOrientation.portraitUp,
                                  DeviceOrientation.portraitDown,
                                ]);

                                Navigator.pop(
                                  context,
                                  widget.result.winner == widget.character1.name,
                                );
                              },
                              child: Text(
                                widget.result.winner == widget.character1.name
                                    ? 'Siguiente batalla'
                                    : 'Volver',
                              ),
                            )
                          else
                            ElevatedButton(
                              onPressed: () async {
                                await SystemChrome.setPreferredOrientations([
                                  DeviceOrientation.portraitUp,
                                  DeviceOrientation.portraitDown,
                                ]);
                                Navigator.pop(context);
                              },
                              child: Text('Volver'),
                            ),
                        ],
                  ),
                  _buildFighter(widget.character2),
                ],
              ),
            ],
          ),
        ],
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
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}
