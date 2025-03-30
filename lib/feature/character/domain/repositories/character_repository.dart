import '../../../../core/common/utils/typedefs.dart';
import '../entities/character_entity.dart';
import '../entities/location.dart';

abstract class CharacterRepository {
  const CharacterRepository();

  ResultFuture<List<CharacterEntity>> getAllCharacters(int page);

  ResultFuture<List<CharacterEntity>> getFavoriteCharactersFromCache();
  ResultVoid<void> addFavoriteCharacter(
      int id,
      String name,
      String status,
      String species,
      Location origin,
      String image
  );
  ResultVoid<void> removeFromFavorites(int id);
  ResultFuture<bool> isFavorite(int id);
}