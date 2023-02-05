import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flim_fu/src/features/home/domain/entities/all_movie_info.dart';

import '../../../../../core/use-case/use_case.dart';
import '../../../../../core/utils/error_message_gen.dart';
import '../../../domain/use-cases/get_popular_movies.dart';



part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final GetPopularMovies getPopularMovies;

  PopularBloc({
    required this.getPopularMovies,
  }) : super(PopularInitial()) {
    on<PopularEvent>((event, emit) {});

    on<GetPopularMovieEvent>(_getPopularMovies);

  }

  void _getPopularMovies(event, emit) async {
    emit(LoadingState());
    final popularMovie = await getPopularMovies(NoParams());

    await popularMovie!.fold(
      (failure) async => emit(ErrorState(
        message: mapFailureToMessage(failure),
      )),
      (popularMovie) async {
        return emit(LoadedPopularState(popularMovie: popularMovie));
      },
    );
  }
}
