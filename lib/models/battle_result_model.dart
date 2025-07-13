import 'character_model.dart';
import 'dart:math';

class BattleResult {
  final Character fighter1;
  final Character fighter2;
  final String winner;
  final String summary;

  BattleResult({
    required this.fighter1,
    required this.fighter2,
    required this.winner,
    required this.summary,
  });

  static BattleResult simulate(Character c1, Character c2) {
    final BigInt ki1 = _parseKi(c1.maxKi);
    final BigInt ki2 = _parseKi(c2.maxKi);

    String winner;
    String summary;

    if (ki1 > ki2) {
      winner = c1.name;
      summary = '${c1.name} gana el combate con un Ki de ${c1.maxKi} contra ${c2.name} con ${c2.maxKi}.';
    } else if (ki2 > ki1) {
      winner = c2.name;
      summary = '${c2.name} vence a ${c1.name} con su Ki de ${c2.maxKi}.';
    } else {
      winner = 'Empate';
      summary = 'Ambos tienen el mismo Ki (${c1.maxKi}). El combate termina en empate.';
    }

    return BattleResult(
      fighter1: c1,
      fighter2: c2,
      winner: winner,
      summary: summary,
    );
  }


  static BigInt _parseKi(String kiStr) {
    final lower = kiStr.toLowerCase().trim();

    final Map<String, int> multipliers = {
      'million': 6,
      'billion': 9,
      'trillion': 12,
      'quadrillion': 15,
      'quintillion': 18,
      'sextillion': 21,
      'septillion': 24,
    };

    final match = RegExp(r'([\d.,]+)\s*(\w+)').firstMatch(lower);
    if (match != null) {
      final numberStr = match.group(1)!.replaceAll(',', '');
      final suffix = match.group(2)!;

      final multiplier = multipliers.entries.firstWhere(
        (e) => suffix.contains(e.key),
        orElse: () => const MapEntry('', 0),
      );

      final doubleValue = double.tryParse(numberStr) ?? 0;
      final value = doubleValue * pow(10, multiplier.value);

      return BigInt.from(value);
    }

    final numericOnly = lower.replaceAll(RegExp(r'[^\d]'), '');
    return BigInt.tryParse(numericOnly) ?? BigInt.zero;
  }
}
