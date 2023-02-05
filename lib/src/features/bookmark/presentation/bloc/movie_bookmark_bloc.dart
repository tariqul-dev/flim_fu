import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flim_fu/src/features/details/presentation/bloc/status/status_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../../core/use-case/use_case.dart';
import '../../../../core/utils/error_message_gen.dart';
import '../../domain/entities/bookmark_movie.dart';
import '../../domain/use-cases/add_to_bookmark.dart';
import '../../domain/use-cases/delete_movie_from_bookmark.dart';
import '../../domain/use-cases/find_movie_in_bookmark_list.dart';
import '../../domain/use-cases/get_bookmark_movies.dart';

part 'movie_bookmark_event.dart';
part 'movie_bookmark_state.dart';

class MovieBookmarkBloc extends Bloc<MovieBookmarkEvent, MovieBookmarkState> {
  final GetBookmarkMovies getBookmarkMovies;
  final AddToBookmark addToBookmark;
  final DeleteMovieFromBookmark deleteMovieFromBookmark;
  final FindMovieInBookmarkList findMovieInBookmarkList;
  final StatusBloc statusBloc;

  MovieBookmarkBloc({
    required this.statusBloc,
    required this.getBookmarkMovies,
    required this.addToBookmark,
    required this.deleteMovieFromBookmark,
    required this.findMovieInBookmarkList,
  }) : super(MovieBookmarkInitial()) {
    on<MovieBookmarkEvent>((event, emit) {});

    on<GetBookmarkedMoviesEvent>((event, emit) async {
      emit(LoadingState());
      final bookmarkedMovies = await getBookmarkMovies(NoParams());
      await bookmarkedMovies!.fold(
        (failure) async => emit(
          ErrorState(
            message: mapFailureToMessage(failure),
          ),
        ),
        (movies) async {
          if (movies.isNotEmpty) {
            emit(LoadedState(bookmarkMovieList: movies));
          } else {
            emit(EmptyState());
          }
        },
      );
    });

    on<AddMovieToBookmarkEvent>(_addToBookmark);

    on<DeleteMovieFromBookmarkEvent>(_deleteFromBookmark);

    on<FindFromBookmarkEvent>(_findMovieFromBookmark);
  }

  _addToBookmark(event, emit) async {
    // emit(LoadingState());
    // emit(BookmarkStatusState(isBookmarked: event.isBookmarked));

    final foundOrNot = await findMovieInBookmarkList(
        FindMovieParams(id: event.bookmarkMovie.id!));
    await foundOrNot!.fold(
      (failure) async => emit(
        ErrorState(
          message: mapFailureToMessage(failure),
        ),
      ),
      (isFound) async {
        if (isFound != true) {
          final addMovieToBookmark = await addToBookmark(
            BookmarkParams(
              bookmarkMovie: event.bookmarkMovie,
            ),
          );

          await addMovieToBookmark!.fold(
            (failure) async => emit(
              ErrorState(
                message: mapFailureToMessage(failure),
              ),
            ),
            (_) async {
              // emit(BookmarkStatusState());

              emit(const SuccessState(isBookmarked: true));
            },
          );
        } else {
          add(DeleteMovieFromBookmarkEvent(movieId: event.bookmarkMovie.id!));
        }
        // statusBloc.add(FindMovieFromBookmarkStatusEvent(movieId: event.bookmarkMovie.id!));
      },
    );
  }

  _deleteFromBookmark(event, emit) async {
    final intOrFailure =
        await deleteMovieFromBookmark(DelParams(id: event.movieId));
    await intOrFailure!.fold(
      (failure) async => emit(
        ErrorState(
          message: mapFailureToMessage(failure),
        ),
      ),
      (index) async {
        emit(const SuccessState(isBookmarked: false));
      },
    );

    // on<FindMovieInBookmarkListEvent>((event, emit) async {
    //   print('finding');
    //   final movieFoundOrNot = await findMovieInBookmarkList(
    //     FindMovieParams(id: event.movieId),
    //   );
    //
    //   await movieFoundOrNot!.fold(
    //     (failure) async => emit(
    //       ErrorState(
    //         message: mapFailureToMessage(failure),
    //       ),
    //     ),
    //     (isFound) async => emit(
    //       FindMovieInBookmarkListState(isMovieFound: isFound),
    //     ),
    //   );
    // });
  }

  _findMovieFromBookmark(event, emit) async {
    final foundOrNot =
        await findMovieInBookmarkList(FindMovieParams(id: event.movieId));
    await foundOrNot!.fold(
      (failure) async => emit(
        ErrorState(
          message: mapFailureToMessage(failure),
        ),
      ),
      (isFound) async {
        print('isFound find movie: $isFound');
        emit(
           SuccessState(isBookmarked: isFound),
        );
      },
    );
  }
}
