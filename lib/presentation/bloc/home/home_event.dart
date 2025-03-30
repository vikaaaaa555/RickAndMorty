part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class LoadCharactersEvent extends HomeEvent {
  final int page;
  const LoadCharactersEvent({required this.page});

  @override
  List<Object?> get props => [page];
}

final class SwipeEvent extends HomeEvent {
  final CharacterEntity character;
  const SwipeEvent({required this.character});

  @override
  List<Object?> get props => [character];
}

final class AddToFavoritesEvent extends HomeEvent {
  final CharacterEntity character;
  const AddToFavoritesEvent({required this.character});

  @override
  List<Object?> get props => [character];
}

final class RemoveFromFavoritesEvent extends HomeEvent {
  final CharacterEntity character;
  const RemoveFromFavoritesEvent({required this.character});

  @override
  List<Object?> get props => [character];
}
