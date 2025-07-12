import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<int> _favoriteIds = [];

  List<int> get favoriteIds => _favoriteIds;

  FavoritesProvider() {
    _loadFavorites();
  }

  void toggleFavorite(int characterId) {
    if (_favoriteIds.contains(characterId)) {
      _favoriteIds.remove(characterId);
    } else {
      _favoriteIds.add(characterId);
    }
    notifyListeners();
    _saveFavorites();
  }

  bool isFavorite(int characterId) {
    return _favoriteIds.contains(characterId);
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? storedIds = prefs.getStringList('favorites');
    if (storedIds != null) {
      _favoriteIds.addAll(storedIds.map(int.parse));
      notifyListeners();
    }
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final stringIds = _favoriteIds.map((id) => id.toString()).toList();
    await prefs.setStringList('favorites', stringIds);
  }
}
