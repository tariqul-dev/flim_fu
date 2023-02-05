import 'package:flim_fu/src/features/bookmark/presentation/bloc/movie_bookmark_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/movie.dart';
import '../../../../core/presentation/widgets/text_widgets.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../../core/utils/screen_size.dart';
import '../../../details/presentation/widgets/genes_widget.dart';

class BookmarkExtraWidget extends StatelessWidget {
  final Movie movie;
  final ScreenSize screenSize;
  const BookmarkExtraWidget(
      {required this.movie, required this.screenSize, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: screenSize.screenWidth! * 0.6,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  context.read<MovieBookmarkBloc>().add(
                        DeleteMovieFromBookmarkEvent(movieId: movie.id!),
                      );
                  context.read<MovieBookmarkBloc>().add(
                        GetBookmarkedMoviesEvent(),
                      );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
        screenSize.smallHeightSizedBox,
        SizedBox(
          width: screenSize.screenWidth! * 0.6,
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movie.genres?.length,
            itemBuilder: (context, index) {
              return GenesWidget(
                genName: movie.genres![index].name!,
              );
            },
          ),
        ),
        screenSize.smallHeightSizedBox,
        Row(
          children: [
            const Icon(
              Icons.timer_outlined,
            ),
            TitleSmalltWidget(
              subtitle: minutesToHourMinute(
                movie.runtime!.toInt(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
