import '../../../../core/entities/movie.dart';

abstract class HomeMovieLocalDataSource {
  /// Get all bookmarked movie from local storage
  ///
  /// Throws [LocalDataException] on exception
  Future<List<Movie>?> getBookMarkedMovies();

  /// Store a bookmarked movie to local storage
  ///
  /// Throws [LocalDataException] on exception
  Future<void> bookMarkMovie(Movie toBookMarkMovie);
}

class HomeLocalDataSourceImpl implements HomeMovieLocalDataSource {
  // final

  @override
  Future<void> bookMarkMovie(Movie toBookMarkMovie) {
    // TODO: implement bookMarkMovie
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>?> getBookMarkedMovies() {
    // TODO: implement getBookMarkedMovies
    throw UnimplementedError();
  }
}
