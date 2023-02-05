part of 'popular_bloc.dart';

abstract class PopularEvent extends Equatable {
  const PopularEvent();

  @override
  List<Object> get props => [];
}


class GetPopularMovieEvent extends PopularEvent{}
class LoadMorePopularMovieEvent extends PopularEvent{}
