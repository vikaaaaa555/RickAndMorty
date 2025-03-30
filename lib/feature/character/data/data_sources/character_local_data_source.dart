import 'dart:convert';

import 'package:rick_and_morty/core/error/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/character_model.dart';

abstract class CharacterLocalDataSource {
  Future<List<CharacterModel>> getFavoriteCharactersFromCache();
  Future<void> addFavoriteCharacter(CharacterModel characters);
  Future<void> removeFromFavorites(CharacterModel character);
  Future<bool> isFavorite(CharacterModel character);
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
  Future<void> addFavoriteCharacter(CharacterModel character) async {
    final favorites = await getFavoriteCharactersFromCache();
    if (!favorites.any((fav) => fav.id == character.id)) {
      favorites.add(character);
      final jsonCharactersList =
          favorites.map((e) => json.encode(e.toJson())).toList();
      await sharedPreferences.setStringList(
          _cachedCharactersList, jsonCharactersList);
    }
  }

  @override
  Future<void> removeFromFavorites(CharacterModel character) async {
    final favorites = await getFavoriteCharactersFromCache();
    favorites.removeWhere((fav) => fav.id == character.id);
    final jsonCharactersList =
        favorites.map((e) => json.encode(e.toJson())).toList();
    await sharedPreferences.setStringList(
        _cachedCharactersList, jsonCharactersList);
  }

  @override
  Future<bool> isFavorite(CharacterModel character) async {
    final favorites = await getFavoriteCharactersFromCache();
    return favorites.any((fav) => fav.id == character.id);
  }
}
