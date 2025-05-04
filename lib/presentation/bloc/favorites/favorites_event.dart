part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

final class LoadCharactersFromStorageEvent extends FavoritesEvent {
  const LoadCharactersFromStorageEvent();
}

final class RemoveFromFavoritesEvent extends FavoritesEvent {
  final CharacterEntity character;
  const RemoveFromFavoritesEvent({required this.character});

  @override
  List<Object?> get props => [character];
}
