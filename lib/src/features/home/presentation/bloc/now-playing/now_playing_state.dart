part of 'now_playing_bloc.dart';

abstract class NowPlayingState extends Equatable {
  const NowPlayingState();
  
  @override
  List<Object> get props => [];
}

class NowPlayingInitial extends NowPlayingState {}

class LoadingState extends NowPlayingState {}

class LoadedNowPlayingState extends NowPlayingState {
  final AllMovieInfo nowPlayingMove;

  const LoadedNowPlayingState({required this.nowPlayingMove});
    @override
  List<Object> get props => [nowPlayingMove];
}



class ErrorState extends NowPlayingState {
  final String message;
  const ErrorState({required this.message});

    @override
  List<Object> get props => [message];
}
