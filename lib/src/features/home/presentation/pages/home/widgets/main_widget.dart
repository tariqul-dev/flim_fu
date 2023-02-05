import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/screen_size.dart';
import '../../../bloc/now-playing/now_playing_bloc.dart';
import '../../drawers/home_drawer.dart';
import 'now_playing_widget.dart';
import 'popular_movie_widget.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context: context);

    Future.delayed(
      Duration.zero,
      () {
        context.read<NowPlayingBloc>().add(GetNowPlayingMovieEvent());
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flim Fu'),
      ),
      drawer: const HomeDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.halfScreenHeight,
                  child: const NowPlayingWidget(),
                ),
                // const Expanded(child: NowPlayingWidget()),
                screenSize.smallHeightSizedBox,
                SizedBox(
                  height: screenSize.screenHeight! * 0.8,
                  child: const PopularMovieWidget(),
                ),
                // const Expanded(child: PopularMovieWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
