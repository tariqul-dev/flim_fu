import 'package:dio/dio.dart';
import 'package:flim_fu/src/core/network/network_info.dart';
import 'package:flim_fu/src/features/details/data/data-sources/details_movie_local_data_source.dart';
import 'package:flim_fu/src/features/details/data/repositories/details_repository_impl.dart';
import 'package:flim_fu/src/features/details/domain/repositories/details_repository.dart';
import 'package:flim_fu/src/features/details/presentation/bloc/status/status_bloc.dart';
import 'package:get_it/get_it.dart';

import '../src/features/details/data/data-sources/details_movie_remote_data_source.dart';

final sl = GetIt.instance;

void detailsInjection() {
  //! Features - bookmark
  // bloc
  sl.registerFactory(
    () => StatusBloc(
      findMovieInBookmarkList: sl(),
    ),
  );

  // use cases

  // Repository
  sl.registerLazySingleton<DetailsRepository>(
    () => DetailsRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data source
  sl.registerLazySingleton<DetailsMovieRemoteDataSource>(
    () => DetailsMovieRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<DetailsMovieLocalDataSource>(
    () => DetailsMovieLocalDataSourceImpl(
      db: sl(),
    ),
  );

  //! Core

  //! External
}
