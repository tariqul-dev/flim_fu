part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();
  
  @override
  List<Object> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}


class LoadingState extends MovieDetailsState {}


class LoadedDetailsState extends MovieDetailsState {
  final Movie movieDetails;
  const LoadedDetailsState({required this.movieDetails});
    @override
  List<Object> get props => [movieDetails];
}

class ErrorState extends MovieDetailsState {
  final String message;
  const ErrorState({required this.message});

    @override
  List<Object> get props => [message];
}

