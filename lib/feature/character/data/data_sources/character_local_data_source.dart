import 'dart:convert';

import 'package:rick_and_morty/core/error/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/character_model.dart';

abstract class CharacterLocalDataSource {
  Future<void> favoritePersonsToCache(List<CharacterModel> characters);

  Future<List<CharacterModel>> getFavoriteCharactersFromCache();
}

const _cachedCharactersList = 'CACHED_CHARACTERS_LIST';

class CharacterLocalDataSourceImpl implements CharacterLocalDataSource {
  final SharedPreferences sharedPreferences;

  const CharacterLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> favoritePersonsToCache(List<CharacterModel> characters) {
    final List<String> jsonCharactersList =
        characters.map((e) => json.encode(e.toJson())).toList();

    sharedPreferences.setStringList(_cachedCharactersList, jsonCharactersList);

    return Future.value(jsonCharactersList);
  }

  @override
  Future<List<CharacterModel>> getFavoriteCharactersFromCache() {
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
}
