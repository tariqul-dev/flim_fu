import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/entities/movie.dart';
import '../../../../../../core/presentation/widgets/loading_widget.dart';
import '../../../../../../core/router/on_tap_manager.dart';
import '../../../../../../core/utils/screen_size.dart';
import '../../../bloc/popular/popular_bloc.dart';
import '../../../widgets/movie_list_card_widget.dart';
import '../../../widgets/title_and_button_widget.dart';
import '../../../../../details/presentation/pages/details_page.dart';
import '../../movies/movie_list_page.dart';

class PopularMovieWidget extends StatelessWidget {
  const PopularMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context: context);

    Future.delayed(
      Duration.zero,
      () {
        context.read<PopularBloc>().add(GetPopularMovieEvent());
      },
    );

    return BlocBuilder<PopularBloc, PopularState>(
      builder: (context, state) {
        if (state is LoadedPopularState) {
          final movies = state.popularMovie.movies!;

          return Column(
            children: [
              TitileAndButtonWidget(
                title: 'Polular',
                onTap: () {
                  Goto.navigate(context,
                      routeName: MovieListPage.routeName, arguments: movies);
                },
              ),
              Expanded(
                child: popularBody(movies, screenSize),
              ),
            ],
          );
        }
        return const LoadingWidget();
      },
    );
  }

  ListView popularBody(List<Movie> movies, ScreenSize screenSize) {
    return ListView.builder(
      // physics: const NeverScrollableScrollPhysics(),
      physics: const ScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      shrinkWrap: true,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Goto.navigate(
              context,
              routeName: DetailsPage.routeName,
              arguments: movies[index].id,
            );
          },
          child: MovieListCardWidget(
            movie: movies[index],
          ),
        );
      },
    );
  }
}
