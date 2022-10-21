import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rickmorty/features/data/network_data/character_repo.dart';
import 'package:rickmorty/features/data/network_data/dio_settings.dart';
import 'package:rickmorty/features/domain/repositories/base_repo.dart';
import 'package:rickmorty/features/domain/usecases/character_usecase.dart';
import 'package:rickmorty/features/domain/usecases/user_usecase.dart';
import 'package:rickmorty/features/presentation/bloc/character_bloc.dart';
import 'package:rickmorty/features/presentation/bloc/user_bloc.dart/user_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton<DioSettings>(
    () => DioSettings(),
  );

  sl.registerLazySingleton<BaseCharRepo>(
    () => ImplCharRepo(dio: sl<DioSettings>().dio),
  );

  sl.registerLazySingleton<CharacterCase>(
    () => CharacterCase(
      charRepo: sl(),
    ),
  );
  sl.registerLazySingleton<UserCase>(
    () => UserCase(
      prefs: sl(),
    ),
  );

  sl.registerFactory<CharacterBloc>(
    () => CharacterBloc(
      usecase: sl(),
    ),
  );

  sl.registerFactory<UserBloc>(
    () => UserBloc(
      usecase: sl(),
    ),
  );
}
