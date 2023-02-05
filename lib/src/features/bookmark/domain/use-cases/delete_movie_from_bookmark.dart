import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use-case/use_case.dart';
import '../repositories/bookmark_repository.dart';

class DeleteMovieFromBookmark implements UseCase<void, DelParams> {
  final BookmarkRepository repository;
  DeleteMovieFromBookmark({required this.repository});

  @override
  Future<Either<Failure, int>?> call(DelParams params) async {
    return await repository.deleteMovieFromBookmark(params.id);
  }
}

class DelParams extends Equatable {
  final num id;
  const DelParams({required this.id});

  @override
  List<Object?> get props => [id];
}
