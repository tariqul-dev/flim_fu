import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flim_fu/src/core/error/failures.dart';
import 'package:flim_fu/src/core/use-case/use_case.dart';
import 'package:flim_fu/src/features/bookmark/domain/repositories/bookmark_repository.dart';

class FindMovieInBookmarkList implements UseCase<bool, FindMovieParams> {
  final BookmarkRepository repository;

  FindMovieInBookmarkList({required this.repository});

  @override
  Future<Either<Failure, bool>?> call(FindMovieParams params) async {
    return await repository.findMovieInBookmarkList(params.id);
  }
}

class FindMovieParams extends Equatable {
  final num id;

  const FindMovieParams({required this.id});

  @override
  List<Object?> get props => [id];
}
