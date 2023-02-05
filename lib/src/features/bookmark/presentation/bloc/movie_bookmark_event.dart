part of 'movie_bookmark_bloc.dart';

abstract class MovieBookmarkEvent extends Equatable {
  const MovieBookmarkEvent();

  @override
  List<Object> get props => [];
}

class GetBookmarkedMoviesEvent extends MovieBookmarkEvent {}

class AddMovieToBookmarkEvent extends MovieBookmarkEvent {
  final BookmarkMovie bookmarkMovie;
  const AddMovieToBookmarkEvent({
    required this.bookmarkMovie,
  });

  @override
  List<Object> get props => [bookmarkMovie];
}

class DeleteMovieFromBookmarkEvent extends MovieBookmarkEvent {
  final num movieId;
  const DeleteMovieFromBookmarkEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

class FindFromBookmarkEvent extends MovieBookmarkEvent {
  final num movieId;
  const FindFromBookmarkEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
