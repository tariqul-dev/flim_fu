import 'package:flutter/material.dart';

import '../../../../../core/entities/movie.dart';
import '../../../../../core/router/on_tap_manager.dart';
import '../../widgets/movie_list_card_widget.dart';
import '../../../../details/presentation/pages/details_page.dart';

class MovieListPage extends StatelessWidget {
  static const routeName = '/movie_list';
  final List<Movie> movies;
  const MovieListPage({required this.movies, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) => InkWell(
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
        ),
      ),
    );
  }
}
