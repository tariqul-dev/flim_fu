import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/error_message_gen.dart';
import '../../../../bookmark/domain/use-cases/find_movie_in_bookmark_list.dart';

part 'status_event.dart';
part 'status_state.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  final FindMovieInBookmarkList findMovieInBookmarkList;
  StatusBloc({
    required this.findMovieInBookmarkList,
  }) : super(StatusInitial()) {
    on<StatusEvent>((event, emit) {});

    on<FindMovieFromBookmarkStatusEvent>(_findMovieFromBookmark);
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
          FindMovieFromBookmarkStatusState(isMovieFound: isFound),
        );
      },
    );
  }
}
