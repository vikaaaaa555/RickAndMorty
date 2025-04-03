import 'package:get_it/get_it.dart';

import '../../../feature/character/data/data_sources/character_local_data_source.dart';
import '../../../feature/character/data/data_sources/character_remote_data_source.dart';
import '../../../feature/character/data/repositories/character_repository_impl.dart';
import '../../../feature/character/domain/repositories/character_repository.dart';
import '../../../feature/character/domain/use_cases/get_all_characters.dart';

final sl = GetIt.instance;

Future<void> registerAppDependencies() async {
  await Future.wait([
    _registerUseCases(),
    _registerRepositories(),
    _registerDataSources(),
  ]);
}

Future<void> _registerUseCases() async {
  sl.registerLazySingleton(() => GetAllCharactersUseCase(sl()));
}

Future<void> _registerRepositories() async {
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(
       remoteDataSource: sl(), localDataSource: sl()));
}

Future<void> _registerDataSources() async {
  sl
    ..registerLazySingleton<CharacterRemoteDataSource>(
        () => CharacterRemoteDataSourceImpl(client: sl()))
    ..registerLazySingleton<CharacterLocalDataSource>(
        () => CharacterLocalDataSourceImpl(sharedPreferences: sl()));
}