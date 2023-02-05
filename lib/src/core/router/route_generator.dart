import 'package:flim_fu/src/features/details/presentation/bloc/status/status_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../../features/bookmark/presentation/pages/bookmark_page.dart';
import '../../features/details/presentation/bloc/movie_details_bloc.dart';
import '../../features/home/presentation/bloc/now-playing/now_playing_bloc.dart';
import '../../features/home/presentation/bloc/popular/popular_bloc.dart';
import '../../features/details/presentation/pages/details_page.dart';
import '../../features/home/presentation/pages/home/home_page.dart';
import '../../features/home/presentation/pages/movies/movie_list_page.dart';
import '../entities/movie.dart';

class RouteGenerator {
  static Route<dynamic>? generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => sl<NowPlayingBloc>(),
                    ),
                    BlocProvider(
                      create: (context) => sl<PopularBloc>(),
                    ),
                  ],
                  child: const HomePage(),
                ));
      case DetailsPage.routeName:
        {
          final int id = settings.arguments as int;
          return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => sl<MovieDetailsBloc>(),),
                  BlocProvider(create: (context) => sl<StatusBloc>(),),
                ],
                child: DetailsPage(movieId: id)),
          );
        }

      case MovieListPage.routeName:
        {
          final movies = settings.arguments as List<Movie>;
          return MaterialPageRoute(
              builder: (context) => MovieListPage(
                    movies: movies,
                  ));
        }
      case BookmarkPage.routeName:
        {
          // final movies = settings.arguments as List;
          return MaterialPageRoute(builder: (context) => const BookmarkPage());
        }

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
