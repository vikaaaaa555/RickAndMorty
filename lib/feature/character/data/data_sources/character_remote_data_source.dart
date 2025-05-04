import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/core/error/exception.dart';

import '../../../../core/common/utils/typedefs.dart';
import '../../../../core/error/failure.dart';
import '../models/character_model.dart';

abstract class CharacterRemoteDataSource {
  ResultFuture<List<CharacterModel>> getAllCharacters(int page);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final http.Client client;

  CharacterRemoteDataSourceImpl({required this.client});

  @override
  ResultFuture<List<CharacterModel>> getAllCharacters(int page) async {
    try {
      final url =
          Uri.parse('https://rickandmortyapi.com/api/character/?page=$page');
      final headers = {'Content-Type': 'application/json'};

      final response = await client.get(url, headers: headers);

      if (response.statusCode != 200) {
        throw APIException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      final characters = json.decode(response.body);
      return Right((characters['results'] as List)
          .map((character) => CharacterModel.fromJson(character))
          .toList());
    } on APIException catch (e) {
      return Left(APIFailure(message: e.toString(), statusCode: 505));
    }
  }
}
