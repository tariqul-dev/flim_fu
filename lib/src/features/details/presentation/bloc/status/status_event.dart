part of 'status_bloc.dart';

abstract class StatusEvent extends Equatable {
  const StatusEvent();
}

class FindMovieFromBookmarkStatusEvent extends StatusEvent{
  final num movieId;
  const FindMovieFromBookmarkStatusEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}