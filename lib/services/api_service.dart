import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:maqueta_3/models/character_model.dart';


class ApiService {
  static const String _baseUrl = 'https://dragonball-api.com/api';

  Future<Character> fetchCharacterById(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/characters/$id'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Character.fromJson(jsonData);
    } else {
      throw Exception('Error al obtener personaje con ID $id');
    }
  }

  Future<List<Character>> fetchAllCharacters() async {
    int currentPage = 1;
    int totalPages = 1;
    List<Character> allCharacters = [];

    while (currentPage <= totalPages) {
      final response = await http.get(Uri.parse('https://dragonball-api.com/api/characters?page=$currentPage&limit=20'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final items = jsonData['items'] as List;

        final charactersPage = items.map((e) => Character.fromJson(e)).toList();
        allCharacters.addAll(charactersPage);

        if (currentPage == 1) {
          totalPages = jsonData['meta']['totalPages'];
        }

        currentPage++;
      } else {
        throw Exception('Fallo al obtener los personajes en la página $currentPage');
      }
    }

    return allCharacters;
  }

}
