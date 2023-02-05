part of 'status_bloc.dart';

abstract class StatusState extends Equatable {
  const StatusState();
}

class StatusInitial extends StatusState {
  @override
  List<Object> get props => [];
}

class FindMovieFromBookmarkStatusState extends StatusState {
  final bool isMovieFound;

  const FindMovieFromBookmarkStatusState({required this.isMovieFound});

  @override
  List<Object> get props => [isMovieFound];

}

class ErrorState extends StatusState {
  final String message;
  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}