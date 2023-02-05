// ignore: must_be_immutable
import '../../../../core/entities/movie.dart';
import '../../../../core/models/movie_model.dart';

class BookmarkMovie extends Movie {
  BookmarkMovie({
    String? backdropPath,
    List<GenresModel>? genres,
    num? id,
    String? originalTitle,
    num? runtime,
    num? voteAverage,
  }) : super(
          backdropPath: backdropPath,
          genres: genres,
          id: id,
          originalTitle: originalTitle,
          runtime: runtime,
          voteAverage: voteAverage,
        );

  @override
  List<Object?> get props => [];
}
