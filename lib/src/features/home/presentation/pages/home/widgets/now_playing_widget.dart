import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/entities/movie.dart';
import '../../../../../../core/presentation/widgets/loading_widget.dart';
import '../../../../../../core/router/on_tap_manager.dart';
import '../../../../../../core/utils/screen_size.dart';
import '../../../bloc/now-playing/now_playing_bloc.dart';
import '../../../widgets/title_and_button_widget.dart';
import '../../movies/movie_list_page.dart';
import 'movie_card_widget.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context: context);

    return BlocBuilder<NowPlayingBloc, NowPlayingState>(
      builder: (context, state) {
        if (state is LoadedNowPlayingState) {
          final movies = state.nowPlayingMove.movies!;
          return nowPlayingBody(context, movies, screenSize);
        }
        return const LoadingWidget();
      },
    );
  }

  Column nowPlayingBody(
      BuildContext context, List<Movie> movies, ScreenSize screenSize) {
    return Column(
      children: [
        TitileAndButtonWidget(
          title: 'Now Showing',
          onTap: () {
            Goto.navigate(context,
                routeName: MovieListPage.routeName, arguments: movies);
          },
        ),
        Expanded(
          flex: 2,
          child: ListView.builder(
            itemCount: movies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => MovieCardWidget(
              movie: movies[index],
            ),
          ),
        ),
      ],
    );
  }
}
