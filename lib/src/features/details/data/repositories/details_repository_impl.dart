import 'package:dartz/dartz.dart';
import 'package:flim_fu/src/features/details/data/data-sources/details_movie_local_data_source.dart';

import '../../../../core/entities/movie.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/details_repository.dart';
import '../data-sources/details_movie_remote_data_source.dart';

typedef MovieParams = Future<dynamic> Function();

class DetailsRepositoryImpl implements DetailsRepository {
  final DetailsMovieRemoteDataSource remoteDataSource;
  final DetailsMovieLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  DetailsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Movie>>? getMovieDetails(int movieId) async {
    try {
      final remoteMovie = await remoteDataSource.getMovieDetails(movieId);
      return Right(remoteMovie!);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>>? findMovieFromBookmark(num movieId) async{
    try {
      final bool isFound =
          await localDataSource.findMovieFromBookmark(movieId);
      return Right(isFound);
    } on LocalDataException {
      return Left(LocalFailure());
    }
  }
}
