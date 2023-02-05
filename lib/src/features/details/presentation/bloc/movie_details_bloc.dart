import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/entities/movie.dart';
import '../../../../core/utils/error_message_gen.dart';
import '../../domain/use-cases/get_movie_details.dart';


part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails getMovieDetails;
  MovieDetailsBloc({required this.getMovieDetails})
      : super(MovieDetailsInitial()) {
    on<MovieDetailsEvent>((event, emit) {});

    on<GetMovieDetailsEvent>(_onGetMovieDetailsEvent);
  }

  _onGetMovieDetailsEvent(event, emit) async {
    final detailsEither = await getMovieDetails(Params(event.id));
    await detailsEither!.fold(
      (failure) async => emit(
        ErrorState(
          message: mapFailureToMessage(failure),
        ),
      ),
      (movieDetails) async => emit(
        LoadedDetailsState(movieDetails: movieDetails),
      ),
    );
  }
}
