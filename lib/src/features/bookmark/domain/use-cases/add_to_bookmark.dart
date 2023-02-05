import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use-case/use_case.dart';
import '../entities/bookmark_movie.dart';
import '../repositories/bookmark_repository.dart';

class AddToBookmark implements UseCase<void, BookmarkParams> {
  final BookmarkRepository repository;

  const AddToBookmark({required this.repository});

  @override
  Future<Either<Failure, void>?> call(BookmarkParams params) async {
    return await repository.addToBookmarkMovie(params.bookmarkMovie);
  }
}

class BookmarkParams extends Equatable {
  final BookmarkMovie bookmarkMovie;
  const BookmarkParams({required this.bookmarkMovie});

  @override
  List<Object?> get props => [bookmarkMovie];
}
