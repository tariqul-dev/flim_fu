
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/bookmark_movie.dart';

abstract class BookmarkRepository {
  Future<Either<Failure, List<BookmarkMovie>>>? getBookmarkMovies();
  Future<Either<Failure, void>>? addToBookmarkMovie(BookmarkMovie toBookmark);
  Future<Either<Failure, int>>? deleteMovieFromBookmark(num movieId);
  Future<Either<Failure, bool>>? findMovieInBookmarkList(num movieId);

}
