import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/bookmark_movie.dart';
import '../../domain/repositories/bookmark_repository.dart';
import '../data-sources/bookmark_movie_local_data_source.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final BookmarkMoveLocalDataSource localDataSource;
  BookmarkRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, void>>? addToBookmarkMovie(
      BookmarkMovie toBookmark) async {
    try {
      final toBookmarkMovie =
          await localDataSource.addToBookmarkMovie(toBookmark);
      return Right(toBookmarkMovie);
    } on LocalDataException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<BookmarkMovie>>>? getBookmarkMovies() async {
    try {
      final bookmarkMovieList = await localDataSource.getBookMarkedMovies();
      // print(bookmarkMovieList);
      return Right(bookmarkMovieList!);
    } on LocalDataException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, int>>? deleteMovieFromBookmark(num movieId) async {
    try {
      final delBookmarkIndex =
          await localDataSource.deleteMovieFromBookmark(movieId);
      if (delBookmarkIndex < 0) throw LocalDataException();
      return Right(delBookmarkIndex);
    } on LocalDataException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, bool>>? findMovieInBookmarkList(num movieId) async {
    try {
      final bool isFound =
          await localDataSource.findMovieInBookmarkList(movieId);
      return Right(isFound);
    } on LocalDataException {
      return Left(LocalFailure());
    }
  }
}
