import 'package:equatable/equatable.dart';

import '../../../../core/common/use_case.dart';
import '../../../../core/common/utils/typedefs.dart';
import '../entities/character_entity.dart';
import '../repositories/character_repository.dart';

class GetAllCharactersUseCase
    extends UseCaseWithParams<List<CharacterEntity>, GetAllCharactersParams> {
  final CharacterRepository _repository;

  GetAllCharactersUseCase(this._repository);

  @override
  ResultFuture<List<CharacterEntity>> call(
          GetAllCharactersParams params) async =>
      await _repository.getAllCharacters(params.page);
}

class GetAllCharactersParams extends Equatable {
  final int page;

  const GetAllCharactersParams({required this.page});

  @override
  List<Object?> get props => [page];
}
