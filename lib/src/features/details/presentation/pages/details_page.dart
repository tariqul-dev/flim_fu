import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/ImageWidget.dart';
import '../../../../core/presentation/widgets/loading_widget.dart';
import '../../../../core/utils/screen_size.dart';
import '../../../bookmark/presentation/bloc/movie_bookmark_bloc.dart';
import '../bloc/movie_details_bloc.dart';
import '../widgets/details_body.dart';

class DetailsPage extends StatelessWidget {
  static const routeName = '/details';
  final int movieId;
  const DetailsPage({required this.movieId, super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context: context);

    Future.delayed(
      Duration.zero,
      () {
        context.read<MovieDetailsBloc>().add(
              GetMovieDetailsEvent(id: movieId),
            );
        // context.read<StatusBloc>().add(
        //       FindMovieFromBookmarkStatusEvent(movieId: movieId),
        //     );
      },
    );

    return WillPopScope(
      onWillPop: () {
        context.read<MovieBookmarkBloc>().add(GetBookmarkedMoviesEvent());
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
            builder: (context, state) {
              if (state is LoadedDetailsState) {
                final movie = state.movieDetails;
                return Column(
                  children: [
                    ImageWidget(
                      path: movie.backdropPath!,
                    ),
                    DetailsBody(movie: movie, screenSize: screenSize),
                  ],
                );
              }
              return const LoadingWidget();
            },
          ),
        ),
      ),
    );
  }
}
