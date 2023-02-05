part of 'popular_bloc.dart';

abstract class PopularState extends Equatable {
  const PopularState();
  
  @override
  List<Object> get props => [];
}

class PopularInitial extends PopularState {}

class LoadingState extends PopularState {}


class LoadedPopularState extends PopularState {
  final AllMovieInfo popularMovie;

  const LoadedPopularState({required this.popularMovie});
   @override
  List<Object> get props => [popularMovie];
}

class ErrorState extends PopularState {
  final String message;
  const ErrorState({required this.message});
   @override
  List<Object> get props => [message];
}
