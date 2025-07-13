import 'package:dragonballwiki/pages/about.dart';
import 'package:flutter/material.dart';
import 'package:dragonballwiki/providers/preferences_provider.dart';
import 'package:provider/provider.dart';
import 'package:dragonballwiki/providers/favorites_provider.dart';

class PreferencePage extends StatefulWidget {
  const PreferencePage({
    super.key,
  });

  @override
  State<PreferencePage> createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Configuraciones'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Modo Vegeta'),
                Switch(
                  value: appData.themeDark,
                  onChanged: (value) {
                    appData.boolState(value);
                  },
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
              child: const Text('Información sobre los desarrolladores'),
            ),

            const SizedBox(height: 24),
            
            ElevatedButton.icon(
              icon: const Icon(Icons.delete_forever),
              label: const Text('Eliminar todos los favoritos'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Confirmar'),
                    content: const Text('¿Estás seguro de que quieres eliminar todos los personajes favoritos?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          favoritesProvider.clearFavorites();
                          Navigator.pop(context);
                        },
                        child: const Text('Eliminar'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}