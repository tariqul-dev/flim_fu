import 'package:flim_fu/injection_container.dart';
import 'package:flim_fu/src/core/utils/db_helper.dart';
import 'package:flim_fu/src/features/bookmark/data/data-sources/bookmark_movie_local_data_source.dart';
import 'package:flim_fu/src/features/bookmark/data/repositories/bookmark_repository_impl.dart';
import 'package:flim_fu/src/features/bookmark/domain/repositories/bookmark_repository.dart';
import 'package:flim_fu/src/features/bookmark/domain/use-cases/add_to_bookmark.dart';
import 'package:flim_fu/src/features/bookmark/domain/use-cases/delete_movie_from_bookmark.dart';
import 'package:flim_fu/src/features/bookmark/domain/use-cases/find_movie_in_bookmark_list.dart';
import 'package:flim_fu/src/features/bookmark/domain/use-cases/get_bookmark_movies.dart';
import 'package:flim_fu/src/features/bookmark/presentation/bloc/movie_bookmark_bloc.dart';

void bookmarkInjection() async {
  //! Features - bookmark
  // bloc
  sl.registerFactory(
    () => MovieBookmarkBloc(
      statusBloc: sl(),
      getBookmarkMovies: sl(),
      addToBookmark: sl(),
      deleteMovieFromBookmark: sl(),
      findMovieInBookmarkList: sl(),
    ),
  );

  // use cases
  sl.registerLazySingleton(
    () => GetBookmarkMovies(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => AddToBookmark(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => DeleteMovieFromBookmark(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => FindMovieInBookmarkList(
      repository: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<BookmarkRepository>(
    () => BookmarkRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  // Data source
  sl.registerLazySingleton<BookmarkMoveLocalDataSource>(
    () => BookmarkMoveLocalDataSourceImpl(db: sl()),
  );

  //! Core
  final dbHelper = await DBHelper.instance();
  sl.registerFactory(() => dbHelper);

  //! External
}
