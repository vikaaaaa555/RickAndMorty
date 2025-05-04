import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../feature/character/domain/entities/character_entity.dart';
import '../../../feature/character/domain/use_cases/get_all_characters.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllCharactersUseCase _getAllCharactersUseCase;

  int _currentPage = 1;
  bool _hasMore = true;

  HomeBloc({required GetAllCharactersUseCase getAllCharactersUseCase})
      : _getAllCharactersUseCase = getAllCharactersUseCase,
        super(const HomeInitial()) {
    on<LoadCharactersEvent>(_handleLoadCharactersEvent);
    on<SwipeEvent>(_handleSwipeEvent);
    on<AddToFavoritesEvent>(_handleAddToFavoritesEvent);
    on<RemoveFromFavoritesEvent>(_handleRemoveFromFavoritesEvent);
  }

  Future<void> _handleLoadCharactersEvent(
      LoadCharactersEvent event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());

    final result = await _getAllCharactersUseCase(
        GetAllCharactersParams(page: _currentPage));

    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (characters) {
        _hasMore = characters.isNotEmpty;
        emit(HomeSuccess(
          characters: characters,
          currentPage: _currentPage,
          hasMore: _hasMore,
        ));
      },
    );
  }

  Future<void> _handleSwipeEvent(
      SwipeEvent event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeSuccess && _hasMore) {
      _currentPage++;

      final result = await _getAllCharactersUseCase(
          GetAllCharactersParams(page: _currentPage));

      result.fold(
        (failure) => emit(HomeSuccess(
          characters: currentState.characters,
          currentPage: currentState.currentPage,
          hasMore: false,
        )),
        (newCharacters) {
          _hasMore = newCharacters.isNotEmpty;

          emit(HomeSuccess(
            characters: [...currentState.characters, ...newCharacters],
            currentPage: _currentPage,
            hasMore: _hasMore,
          ));
        },
      );
    }
  }

  void _handleAddToFavoritesEvent(
      AddToFavoritesEvent event, Emitter<HomeState> emit) {}

  void _handleRemoveFromFavoritesEvent(
      RemoveFromFavoritesEvent event, Emitter<HomeState> emit) {}
}
