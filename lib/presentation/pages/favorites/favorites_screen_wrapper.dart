import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/utils/constants/styles/text_styles.dart';
import '../../bloc/favorites/favorites_bloc.dart';
import 'favorites_screen.dart';

class FavoritesScreenWrapper extends StatelessWidget {
  const FavoritesScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
      if (state is FavoritesInitial || state is FavoritesLoading) {
        context
            .read<FavoritesBloc>()
            .add(const LoadCharactersFromStorageEvent());
        return const Center(
          child: CircularProgressIndicator(color: Colors.white),
        );
      } else if (state is FavoritesSuccess) {
        return FavoritesScreen(characters: state.characters);
      } else if (state is FavoritesError) {
        return Center(child: Text('Error: ${state.message}'));
      } else {
        return Center(
            child: Text('Unknown state', style: TextStyles.white12Normal));
      }
    });
  }
}
