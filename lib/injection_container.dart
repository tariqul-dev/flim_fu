import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'injections/bookmark_inj.dart';
import 'injections/details_inj.dart';
import 'src/core/network/network_info.dart';
import 'src/features/home/data/data-sources/home_movie_remote_data_source.dart';
import 'src/features/home/data/repositories/home_repository_impl.dart';
import 'src/features/home/domain/repositories/home_repository.dart';
import 'src/features/details/domain/use-cases/get_movie_details.dart';
import 'src/features/home/domain/use-cases/get_now_playing_movies.dart';
import 'src/features/home/domain/use-cases/get_popular_movies.dart';
import 'src/features/details/presentation/bloc/movie_details_bloc.dart';
import 'src/features/home/presentation/bloc/now-playing/now_playing_bloc.dart';
import 'src/features/home/presentation/bloc/popular/popular_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - home
  // bloc

  sl.registerFactory(
    () => NowPlayingBloc(
      getNowPlayingMovies: sl(),
    ),
  );

  sl.registerFactory(
    () => PopularBloc(
      getPopularMovies: sl(),
    ),
  );

  sl.registerFactory(
    () => MovieDetailsBloc(
      getMovieDetails: sl(),
    ),
  );

  // use cases
  sl.registerLazySingleton(
    () => GetNowPlayingMovies(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetPopularMovies(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => GetMovieDetails(
      repository: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remoteDataSource: sl(),
      // localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data source
  sl.registerLazySingleton<HomeMovieRemoteDataSource>(
    () => HomeMovieRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  // sl.registerLazySingleton<HomeMovieLocalDataSource>(() => LocalData )

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: sl(),
    ),
  );

  //! External
  // final db = await openDatabase();
  // sl.registerLazySingleton(() => )
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());

  bookmarkInjection();
  detailsInjection();
}
