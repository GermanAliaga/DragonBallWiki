import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:dragonballwiki/models/character_model.dart';
import 'package:dragonballwiki/models/planet_model.dart';

class ApiService {
  static const String _baseUrl = 'https://dragonball-api.com/api';

  Future<bool> hasInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException {
      return false;
    }
  }

  Future<Character> fetchCharacterById(int id) async {
    if (!await hasInternetConnection()) {
      throw Exception('Sin conexión a Internet');
    }

    final response = await http.get(Uri.parse('$_baseUrl/characters/$id'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Character.fromJson(jsonData);
    } else {
      throw Exception('Error al obtener personaje con ID $id');
    }
  }

  Future<Planet> fetchPlanetById(int id) async {
    if (!await hasInternetConnection()) {
      throw Exception('Sin conexión a Internet');
    }

    final response = await http.get(Uri.parse('$_baseUrl/planets/$id'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Planet.fromJson(jsonData);
    } else {
      throw Exception('Error al obtener planeta con ID $id');
    }
  }

  Future<List<Character>> fetchAllCharacters() async {
    if (!await hasInternetConnection()) {
      throw Exception('Sin conexión a Internet');
    }

    int currentPage = 1;
    int totalPages = 1;
    List<Character> allCharacters = [];

    while (currentPage <= totalPages) {
      final response = await http.get(Uri.parse('$_baseUrl/characters?page=$currentPage&limit=20'));

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
        throw Exception('Error al obtener personajes en la página $currentPage');
      }
    }

    return allCharacters;
  }

  Future<List<Planet>> fetchAllPlanets() async {
    if (!await hasInternetConnection()) {
      throw Exception('Sin conexión a Internet');
    }

    int currentPage = 1;
    int totalPages = 1;
    List<Planet> allPlanets = [];

    while (currentPage <= totalPages) {
      final response = await http.get(Uri.parse('$_baseUrl/planets?page=$currentPage&limit=20'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final items = jsonData['items'] as List;
        final planetsPage = items.map((e) => Planet.fromJson(e)).toList();

        allPlanets.addAll(planetsPage);

        if (currentPage == 1) {
          totalPages = jsonData['meta']['totalPages'];
        }

        currentPage++;
      } else {
        throw Exception('Error al obtener planetas en la página $currentPage');
      }
    }

    return allPlanets;
  }
}
