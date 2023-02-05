import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use-case/use_case.dart';
import '../repositories/details_repository.dart';

class FindMovieInBookmarkList implements UseCase<bool, FindMovieParams> {
  final DetailsRepository repository;

  FindMovieInBookmarkList({required this.repository});

  @override
  Future<Either<Failure, bool>?> call(FindMovieParams params) async {
    return await repository.findMovieFromBookmark(params.id);
  }
}

class FindMovieParams extends Equatable {
  final num id;

  const FindMovieParams({required this.id});

  @override
  List<Object?> get props => [id];
}
