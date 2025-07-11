import 'package:flutter/material.dart';
import 'package:dragonballwiki/models/character_model.dart';
import 'package:dragonballwiki/pages/character_detail_screen.dart';
import 'package:dragonballwiki/services/api_service.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({Key? key}) : super(key: key);

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  late Future<List<Character>> _futureCharacters;
  List<Character> allCharacters = [];
  List<Character> filteredCharacters = [];

  String? selectedRace;
  String? selectedAffiliation;
  String? selectedGender;
  String? selectedPlanet;

  bool showFilters = false;

  @override
  void initState() {
    super.initState();
    _futureCharacters = ApiService().fetchAllCharacters();
    _futureCharacters.then((characters) {
      setState(() {
        allCharacters = characters;
        filteredCharacters = characters;
      });
    });
  }

  void applyFilters() {
    setState(() {
      filteredCharacters = allCharacters.where((character) {
        final matchRace = selectedRace == null || character.race == selectedRace;
        final matchAff = selectedAffiliation == null || character.affiliation == selectedAffiliation;
        final matchGender = selectedGender == null || character.gender == selectedGender;
        final matchPlanet = selectedPlanet == null || character.originPlanet.name == selectedPlanet;
        return matchRace && matchAff && matchGender && matchPlanet;
      }).toList();
    });
  }

  List<String> extractUnique<T>(List<Character> characters, T Function(Character) selector) {
    return characters.map(selector).toSet().map((e) => e.toString()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Personajes de Dragon Ball Z'),
        actions: [
          IconButton(
            icon: Icon(showFilters ? Icons.filter_alt_off : Icons.filter_alt),
            onPressed: () => setState(() => showFilters = !showFilters),
          ),
        ],
      ),
      body: allCharacters.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                if (showFilters) buildFilters(),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredCharacters.length,
                    itemBuilder: (context, index) {
                      final character = filteredCharacters[index];
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(character.image),
                          ),
                          title: Text(character.name),
                          subtitle: Text(character.race),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CharacterDetailScreen(character: character),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget buildFilters() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              buildDropdown('Raza', selectedRace, extractUnique(allCharacters, (c) => c.race), (value) {
                setState(() => selectedRace = value);
                applyFilters();
              }),
              buildDropdown('Afiliación', selectedAffiliation, extractUnique(allCharacters, (c) => c.affiliation), (value) {
                setState(() => selectedAffiliation = value);
                applyFilters();
              }),
              buildDropdown('Género', selectedGender, extractUnique(allCharacters, (c) => c.gender), (value) {
                setState(() => selectedGender = value);
                applyFilters();
              }),
              buildDropdown('Planeta', selectedPlanet, extractUnique(allCharacters, (c) => c.originPlanet.name), (value) {
                setState(() => selectedPlanet = value);
                applyFilters();
              }),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                setState(() {
                  selectedRace = null;
                  selectedAffiliation = null;
                  selectedGender = null;
                  selectedPlanet = null;
                  filteredCharacters = allCharacters;
                });
              },
              child: const Text('Limpiar filtros'),
            ),
          )
        ],
      ),
    );
  }


  Widget buildDropdown(String label, String? value, List<String> items, ValueChanged<String?> onChanged) {
    return SizedBox(
      width: 150,
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(labelText: label, isDense: true),
        isExpanded: true,
        items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
