import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/entities/movie.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/use-case/use_case.dart';
import '../repositories/details_repository.dart';

class GetMovieDetails extends UseCase<Movie, Params> {
  final DetailsRepository repository;
  GetMovieDetails({required this.repository});

  @override
  Future<Either<Failure, Movie>?> call(Params params) async {
    return await repository.getMovieDetails(params.id);
  }
}

class Params extends Equatable {
  final int id;
  const Params(this.id);
  @override
  List<Object?> get props => [id];
}
