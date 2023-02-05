import 'package:sqflite/sqflite.dart';

import '../../../../core/utils/key_helper.dart';
import '../../domain/entities/bookmark_movie.dart';
import '../models/bookmark_movie_model.dart';

abstract class BookmarkMoveLocalDataSource {
  /// Get all bookmarked movie from local storage
  ///
  /// Throws [LocalDataException] on exception
  Future<List<BookmarkMovie>?> getBookMarkedMovies();

  /// Store a bookmarked movie to local storage
  ///
  /// Throws [LocalDataException] on exception
  Future<void> addToBookmarkMovie(BookmarkMovie toBookMarkMovie);

  /// Delete bookmarked movie from local storage
  ///
  /// Throws [LocalDataException] on exception
  Future<int> deleteMovieFromBookmark(num movieId);

  /// Search a movie from bookmark list from local storage
  ///
  /// Throws [LocalDataException] on exception
  Future<bool> findMovieInBookmarkList(num movieId);
}

class BookmarkMoveLocalDataSourceImpl implements BookmarkMoveLocalDataSource {
  final Database db;

  BookmarkMoveLocalDataSourceImpl({required this.db});

  @override
  Future<void> addToBookmarkMovie(BookmarkMovie toBookMarkMovie) async {
    final bookmarkModel = BookmarkMovieModel(
      id: toBookMarkMovie.id,
      originalTitle: toBookMarkMovie.originalTitle,
      runtime: toBookMarkMovie.runtime,
      genres: toBookMarkMovie.genres,
      backdropPath: toBookMarkMovie.backdropPath,
      voteAverage: toBookMarkMovie.voteAverage,
    );

    int id = await db.insert(dbTableNameKey, bookmarkModel.toJson());
    return;
  }

  @override
  Future<List<BookmarkMovie>?> getBookMarkedMovies() async {
    final queryList = await db.query(
      dbTableNameKey,
      columns: [
        movieIdKey,
        movieTitleKey,
        gensKey,
        ratingKey,
        durationKey,
        imgPathKey,
      ],
    );
    return List.generate(
      queryList.length,
      (index) => BookmarkMovieModel.fromJson(
        queryList[index],
      ),
    );
  }

  @override
  Future<int> deleteMovieFromBookmark(num movieId) async {
    return await db.delete(
      dbTableNameKey,
      where: '$movieIdKey = ?',
      whereArgs: [movieId],
    );
  }

  @override
  Future<bool> findMovieInBookmarkList(num movieId) async {
    final query = await db.query(
      dbTableNameKey,
      columns: [
        movieIdKey,
        movieTitleKey,
        gensKey,
        ratingKey,
        durationKey,
        imgPathKey,
      ],
      where: '$movieIdKey = ?',
      whereArgs: [movieId],
    );
    return query.isNotEmpty ? true : false;
  }
}
