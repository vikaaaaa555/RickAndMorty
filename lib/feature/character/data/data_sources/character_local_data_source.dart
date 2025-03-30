import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../../domain/entities/location.dart';
import '../models/character_model.dart';

abstract class CharacterLocalDataSource {
  Future<List<CharacterModel>> getFavoriteCharactersFromCache();
  Future<void> addFavoriteCharacter(
      int id,
      String name,
      String status,
      String species,
      Location origin,
      String image
  );
  Future<void> removeFromFavorites(int id);
  Future<bool> isFavorite(int id);
}

const _cachedCharactersList = 'CACHED_CHARACTERS_LIST';

class CharacterLocalDataSourceImpl implements CharacterLocalDataSource {
  final SharedPreferences sharedPreferences;

  const CharacterLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<CharacterModel>> getFavoriteCharactersFromCache() async {
    final jsonCharactersList =
        sharedPreferences.getStringList(_cachedCharactersList);

    if (jsonCharactersList != null && jsonCharactersList.isNotEmpty) {
      return Future.value(jsonCharactersList
          .map((e) => CharacterModel.fromJson(json.decode(e)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> addFavoriteCharacter(
      int id,
      String name,
      String status,
      String species,
      Location origin,
      String image
  ) async {
    try {
      final favorites = await getFavoriteCharactersFromCache();
      if (!favorites.any((fav) => fav.id == id)) {
        final newCharacter = CharacterModel(
          id: id,
          name: name,
          status: status,
          species: species,
          origin: origin,
          image: image,
        );
        favorites.add(newCharacter);
        final jsonCharactersList = favorites.map((e) => json.encode(e.toJson())).toList();
        await sharedPreferences.setStringList(_cachedCharactersList, jsonCharactersList);
      }
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> removeFromFavorites(int id) async {
    try {
      final favorites = await getFavoriteCharactersFromCache();
      favorites.removeWhere((fav) => fav.id == id);
      final jsonCharactersList = favorites.map((e) => json.encode(e.toJson())).toList();
      await sharedPreferences.setStringList(_cachedCharactersList, jsonCharactersList);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<bool> isFavorite(int id) async {
    try {
      final favorites = await getFavoriteCharactersFromCache();
      return favorites.any((fav) => fav.id == id);
    } catch (e) {
      return false;
    }
  }
}
