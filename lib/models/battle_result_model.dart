import 'character_model.dart';

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
    final normalized = kiStr.replaceAll('.', '').toLowerCase().trim();

    if (normalized.contains('septillion')) {
      return BigInt.from(10).pow(24); // 1e24
    } else if (normalized.contains('quintillion')) {
      return BigInt.from(10).pow(18); // 1e18
    } else if (normalized.contains('quadrillion')) {
      return BigInt.from(10).pow(15);
    } else if (normalized.contains('trillion')) {
      return BigInt.from(10).pow(12);
    } else if (normalized.contains('billion')) {
      return BigInt.from(10).pow(9);
    } else if (normalized.contains('million')) {
      return BigInt.from(10).pow(6);
    } else {
      final numeric = normalized.replaceAll(RegExp(r'[^\d]'), '');
      return BigInt.tryParse(numeric) ?? BigInt.zero;
    }
  }
}
