import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/core/error/exception.dart';

import '../../../../core/common/utils/typedefs.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/character_entity.dart';
import '../models/character_model.dart';

abstract class CharacterRemoteDataSource {
  ResultFuture<List<CharacterEntity>> getAllCharacters(int page);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final http.Client _client;

  CharacterRemoteDataSourceImpl(this._client);

  @override
  ResultFuture<List<CharacterEntity>> getAllCharacters(int page) async {
    try {
      final url =
          Uri.parse('https://rickandmortyapi.com/api/character/?page=$page');
      final headers = { 'Content-Type': 'application/json' };

      final response = await _client.get(url, headers: headers);

      if (response.statusCode != 200) {
        throw APIException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      final decoded = jsonDecode(response.body);
      if (decoded is! List) {
        throw APIException(
          message: 'Expected a list but got ${decoded.runtimeType}',
          statusCode: 200,
        );
      }

      final List<CharacterModel> characterList = (decoded)
          .map((json) => CharacterModel.fromJson(json as DataMap))
          .toList();
      return Right(characterList);
    } on APIException catch (e) {
      return Left(APIFailure(message: e.toString(), statusCode: 505));
    }
  }
}
