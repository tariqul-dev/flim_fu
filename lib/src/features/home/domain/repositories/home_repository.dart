import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/all_movie_info.dart';

abstract class HomeRepository {
  Future<Either<Failure, AllMovieInfo>>? getNowPlayingMovies();
  Future<Either<Failure, AllMovieInfo>>? getPopularMovies();
}
