import 'package:dartz/dartz.dart';

import '../../../../core/entities/movie.dart';
import '../../../../core/error/failures.dart';

abstract class DetailsRepository {
  Future<Either<Failure, Movie>>? getMovieDetails(int movieId);
  Future<Either<Failure, bool>>? findMovieFromBookmark(num movieId);
}
