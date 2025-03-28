import '../../../../core/common/utils/typedefs.dart';
import '../entities/character_entity.dart';

abstract class CharacterRepository {
  const CharacterRepository();

  ResultFuture<List<CharacterEntity>> getAllCharacters(int page);
}