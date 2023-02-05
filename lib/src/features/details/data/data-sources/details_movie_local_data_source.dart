import 'package:sqflite/sqflite.dart';

import '../../../../core/utils/key_helper.dart';

abstract class DetailsMovieLocalDataSource {
  /// Search a movie from bookmark list from local storage
  ///
  /// Throws [LocalDataException] on exception
  Future<bool> findMovieFromBookmark(num movieId);
}

class DetailsMovieLocalDataSourceImpl implements DetailsMovieLocalDataSource {
  final Database db;

  DetailsMovieLocalDataSourceImpl({required this.db});

  @override
  Future<bool> findMovieFromBookmark(num movieId) async {
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
    print('details query: $query');
    return query.isNotEmpty ? true : false;
  }
}
