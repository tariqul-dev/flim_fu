import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/all_movie_info.dart';
import '../../domain/repositories/home_repository.dart';
import '../data-sources/home_movie_remote_data_source.dart';

typedef MovieParams = Future<dynamic> Function();

class HomeRepositoryImpl implements HomeRepository {
  final HomeMovieRemoteDataSource remoteDataSource;
  // final HomeMovieLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.remoteDataSource,
    // required this.localDataSource,
    required this.networkInfo,
  });


  @override
  Future<Either<Failure, AllMovieInfo>>? getNowPlayingMovies() async {
    //  return _getMovieInfo(() => remoteDataSource.getNowPlayingMovies()!);

    try {
      final remoteMovie = await remoteDataSource.getNowPlayingMovies();
      return Right(remoteMovie!);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AllMovieInfo>>? getPopularMovies() async {
    try {
      final remoteMovie = await remoteDataSource.getPopularMovies();
      return Right(remoteMovie!);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  // _getMovieInfo(MovieParams functionCaller) async {
  //   try {
  //     final remoteMovie = await functionCaller();
  //     return Right(remoteMovie!);
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }
}
