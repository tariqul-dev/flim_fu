import 'package:flutter/material.dart';

import '../../../../../../core/entities/movie.dart';
import '../../../../../../core/presentation/widgets/ImageWidget.dart';
import '../../../../../../core/presentation/widgets/text_widgets.dart';
import '../../../../../../core/router/on_tap_manager.dart';
import '../../../../../../core/utils/screen_size.dart';
import '../../../../../../core/utils/static_size.dart';
import '../../../../../../core/presentation/widgets/rating_widget.dart';
import '../../../../../details/presentation/pages/details_page.dart';

class MovieCardWidget extends StatelessWidget {
  final Movie movie;
  const MovieCardWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context: context);

    return GestureDetector(
      onTap: () {
        Goto.navigate(
          context,
          routeName: DetailsPage.routeName,
          arguments: movie.id,
        );
      },
      child: Container(
        width: screenSize.halfScreenWidth,
        padding: const EdgeInsets.symmetric(
          horizontal: StaticSize.size5,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ImageWidget(
                path: movie.backdropPath!,
                elevation: 10,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  screenSize.smallHeightSizedBox,
                  Flexible(
                    child: TitleMediumWidget(
                      title: movie.title!,
                    ),
                  ),
                  screenSize.verySmallHightSizedBox,
                  RatingWidget(
                    screenSize: screenSize,
                    rating: movie.voteAverage!,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
