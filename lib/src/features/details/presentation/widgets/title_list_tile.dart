import 'package:flim_fu/src/core/entities/movie.dart';
import 'package:flim_fu/src/features/bookmark/presentation/bloc/movie_bookmark_bloc.dart';
import 'package:flim_fu/src/features/details/presentation/bloc/movie_details_bloc.dart';
import 'package:flim_fu/src/features/details/presentation/bloc/status/status_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/rating_widget.dart';
import '../../../../core/presentation/widgets/text_widgets.dart';
import '../../../../core/utils/screen_size.dart';
import '../../../bookmark/domain/entities/bookmark_movie.dart';

class TitleListTile extends StatelessWidget {
  const TitleListTile({
    super.key,
    required this.movie,
    required this.screenSize,
  });

  final Movie movie;
  final ScreenSize screenSize;

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration.zero,
      () {
        context
            .read<MovieBookmarkBloc>()
            .add(FindFromBookmarkEvent(movieId: movie.id!));
      },
    );

    final BookmarkMovie movieBookmark = BookmarkMovie(
      id: movie.id,
      backdropPath: movie.backdropPath,
      genres: movie.genres,
      originalTitle: movie.originalTitle,
      runtime: movie.runtime,
      voteAverage: movie.voteAverage,
    );

    return ListTile(
      title: TitleLargeWidget(
        title: movie.title!,
      ),
      subtitle: Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        child: RatingWidget(
          screenSize: screenSize,
          rating: movie.voteAverage!,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          context.read<MovieBookmarkBloc>().add(
                AddMovieToBookmarkEvent(
                  bookmarkMovie: movieBookmark,
                ),
              );

        },
        icon: BlocBuilder<MovieBookmarkBloc, MovieBookmarkState>(
          builder: (context, state) {
            if (state is SuccessState && state.isBookmarked == true) {
              return const Icon(
                Icons.bookmark,
                color: Colors.red,
                size: 30,
              );
            }
            return const Icon(
              Icons.bookmark_border,
              size: 30,
            );
          },
        ),
      ),
    );
  }
}
