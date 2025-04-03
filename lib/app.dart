import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/bloc/home/home_bloc.dart';
import 'package:rick_and_morty/presentation/router/router.dart';

import 'core/common/service/app_dependencies.dart';
import 'core/common/utils/constants/styles/theme_config.dart';
import 'feature/character/domain/use_cases/get_all_characters.dart';
import 'media.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Media.init(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
              create: (context) => HomeBloc(
                  getAllCharactersUseCase: sl<GetAllCharactersUseCase>())),
        ],
        child: MaterialApp.router(
          theme: darkTheme,
          routerDelegate: AppNavigation.router.routerDelegate,
          routeInformationParser: AppNavigation.router.routeInformationParser,
          routeInformationProvider:
              AppNavigation.router.routeInformationProvider,
        ));
  }
}
