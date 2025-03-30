part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class HomeSuccess extends HomeState {
  final List<CharacterEntity> characters;
  final int currentPage;
  final bool hasMore;

  const HomeSuccess({
    required this.characters,
    required this.currentPage,
    required this.hasMore,
  });

  @override
  List<Object?> get props => [characters, currentPage, hasMore];
}

final class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
