import '../../../../core/common/utils/typedefs.dart';
import '../entities/character_entity.dart';

abstract class CharacterRepository {
  const CharacterRepository();

  ResultFuture<List<CharacterEntity>> getAllCharacters(int page);

  ResultFuture<List<CharacterEntity>> getFavoriteCharactersFromCache();
  ResultVoid<void> addFavoriteCharacter(CharacterEntity character);
  ResultVoid<void> removeFromFavorites(CharacterEntity character);
  ResultFuture<bool> isFavorite(CharacterEntity character);
}