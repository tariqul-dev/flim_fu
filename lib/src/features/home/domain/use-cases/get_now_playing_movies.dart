import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use-case/use_case.dart';
import '../entities/all_movie_info.dart';
import '../repositories/home_repository.dart';

class GetNowPlayingMovies extends UseCase<AllMovieInfo, NoParams> {
  final HomeRepository repository;
  GetNowPlayingMovies({required this.repository});

  @override
  Future<Either<Failure, AllMovieInfo>?> call(NoParams params) async {
    return await repository.getNowPlayingMovies();
  }
}
