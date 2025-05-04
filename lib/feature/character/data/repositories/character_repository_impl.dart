import 'package:dartz/dartz.dart';

import '../../../../core/common/utils/typedefs.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/character_entity.dart';
import '../../domain/entities/location.dart';
import '../../domain/repositories/character_repository.dart';
import '../data_sources/character_local_data_source.dart';
import '../data_sources/character_remote_data_source.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;
  final CharacterLocalDataSource localDataSource;

  const CharacterRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource
  });

  @override
  ResultFuture<List<CharacterEntity>> getAllCharacters(int page) async {
    try {
      final result = await remoteDataSource.getAllCharacters(page);
      return result;
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid<void> addFavoriteCharacter(int id, String name, String status,
      String species, Location origin, String image) async {
    try {
      await localDataSource.addFavoriteCharacter(
          id, name, status, species, origin, image);
      return const Right(null);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }

  @override
  ResultFuture<List<CharacterEntity>> getFavoriteCharactersFromCache() async {
    try {
      final result = await localDataSource.getFavoriteCharactersFromCache();
      return Right(result);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }

  @override
  ResultFuture<bool> isFavorite(int id) async {
    try {
      final result = await localDataSource.isFavorite(id);
      return Right(result);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }

  @override
  ResultVoid<void> removeFromFavorites(int id) async {
    try {
      await localDataSource.removeFromFavorites(id);
      return const Right(null);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }
}
