// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/use-case/use_case.dart';
import '../../../../../core/utils/error_message_gen.dart';
import '../../../domain/entities/all_movie_info.dart';
import '../../../domain/use-cases/get_now_playing_movies.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final GetNowPlayingMovies getNowPlayingMovies;

  NowPlayingBloc({
    required this.getNowPlayingMovies,
  }) : super(NowPlayingInitial()) {
    on<NowPlayingEvent>((event, emit) {});

    on<GetNowPlayingMovieEvent>(_nowPlayingMovies);

  }


  void _nowPlayingMovies(event, emit) async {
    emit(LoadingState());

    final nowPlayingMovie = await getNowPlayingMovies(NoParams());

    await nowPlayingMovie?.fold(
      (failure) async => emit(
        ErrorState(message: mapFailureToMessage(failure)),
      ),
      (nowPlaying) async {
        emit(LoadedNowPlayingState(nowPlayingMove: nowPlaying));
      },
    );
  }
}
