import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use-case/use_case.dart';
import '../entities/bookmark_movie.dart';
import '../repositories/bookmark_repository.dart';

class GetBookmarkMovies implements UseCase<List<BookmarkMovie>, NoParams> {
  final BookmarkRepository repository;
  GetBookmarkMovies({required this.repository});

  @override
  Future<Either<Failure, List<BookmarkMovie>>?> call(NoParams params) async {
    return await repository.getBookmarkMovies();
  }
}
