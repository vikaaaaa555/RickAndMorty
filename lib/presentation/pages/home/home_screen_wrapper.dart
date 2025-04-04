import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home/home_bloc.dart';
import 'home_screen.dart';

class HomeScreenWrapper extends StatelessWidget {
  const HomeScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeInitial) {
        context.read<HomeBloc>().add(const LoadCharactersEvent(page: 1));
        return const Center(
          child: CircularProgressIndicator(color: Colors.white),
        );
      } else if (state is HomeLoading) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.white),
        );
      } else if (state is HomeSuccess) {
        return HomeScreen(characters: state.characters);
      } else if (state is HomeError) {
        return Center(child: Text('Error: ${state.message}'));
      }
      return const SizedBox();
    });
  }
}