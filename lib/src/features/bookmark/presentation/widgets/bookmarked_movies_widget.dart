import 'package:flutter/material.dart';

import '../../../../core/entities/movie.dart';
import '../../../../core/router/on_tap_manager.dart';
import '../../../../core/utils/screen_size.dart';
import '../../../details/presentation/pages/details_page.dart';
import '../../../home/presentation/widgets/movie_list_card_widget.dart';
import 'bookmark_extra_widget.dart';

class BookmarkedMoviesWidget extends StatelessWidget {
  final List<Movie> movies;
  const BookmarkedMoviesWidget({
    super.key,
    required this.movies,
    required this.screenSize,
  });

  final ScreenSize screenSize;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
          child: Stack(
            children: [
              MovieListCardWidget(movie: movies[index]),
              Positioned(
                right: 0,
                bottom: 10,
                child: BookmarkExtraWidget(
                  movie: movies[index],
                  screenSize: screenSize,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
