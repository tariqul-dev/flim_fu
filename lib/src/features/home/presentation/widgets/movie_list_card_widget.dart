import 'package:flutter/material.dart';

import '../../../../core/entities/movie.dart';
import '../../../../core/presentation/widgets/ImageWidget.dart';
import '../../../../core/presentation/widgets/text_widgets.dart';
import '../../../../core/utils/screen_size.dart';
import '../../../../core/presentation/widgets/rating_widget.dart';

class MovieListCardWidget extends StatelessWidget {
  final Movie movie;
  const MovieListCardWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context: context);

    return SizedBox(
      height: screenSize.halfScreenHeight! * 0.4,
      width: screenSize.screenHeight,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ImageWidget(
              path: movie.backdropPath!,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleMediumWidget(
                    title: movie.originalTitle.toString(),
                  ),
                  screenSize.smallHeightSizedBox,
                  RatingWidget(
                    screenSize: screenSize,
                    rating: movie.voteAverage!,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
