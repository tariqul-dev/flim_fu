// ignore_for_file: must_be_immutable

part of 'movie_bookmark_bloc.dart';

abstract class MovieBookmarkState extends Equatable {
  const MovieBookmarkState();

  @override
  List<Object> get props => [];
}

class MovieBookmarkInitial extends MovieBookmarkState {}

class LoadingState extends MovieBookmarkState {}

class LoadedState extends MovieBookmarkState {
  final List<BookmarkMovie> bookmarkMovieList;

  const LoadedState({required this.bookmarkMovieList});

  @override
  List<Object> get props => [bookmarkMovieList];
}

class BookmarkStatusState extends MovieBookmarkState {
  bool isBookmarked;
  BookmarkStatusState({this.isBookmarked = false});
  @override
  List<Object> get props => [isBookmarked];
}

class EmptyState extends MovieBookmarkState {}

class SuccessState extends MovieBookmarkState {
  final bool isBookmarked;

  const SuccessState({required this.isBookmarked});
  @override
  // TODO: implement props
  List<Object> get props => [isBookmarked];
}

// class DeleteBookmarkState extends MovieBookmarkState {}

// class FindMovieInBookmarkListState extends MovieBookmarkState {
//   final bool isMovieFound;
//
//   const FindMovieInBookmarkListState({required this.isMovieFound});
//
//   @override
//   List<Object> get props => [isMovieFound];
//
// }


class ErrorState extends MovieBookmarkState {
  final String message;
  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
