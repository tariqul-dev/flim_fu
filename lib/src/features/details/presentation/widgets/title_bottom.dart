import 'package:flutter/material.dart';

import '../../../../core/entities/movie.dart';
import '../../../../core/presentation/widgets/text_widgets.dart';
import '../../../../core/utils/helper_functions.dart';


class TitleBottom extends StatelessWidget {
  const TitleBottom({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            title: const TitleSmalltWidget(subtitle: 'Length'),
            subtitle: TitleMediumWidget(
              title: minutesToHourMinute(
                movie.runtime as int,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: const TitleSmalltWidget(subtitle: 'Language'),
            subtitle: TitleMediumWidget(
              title: movie.spokenLanguages![0].name!,
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: const TitleSmalltWidget(subtitle: 'Rating'),
            subtitle: TitleMediumWidget(
              title: movie.voteAverage!.toStringAsFixed(1),
            ),
          ),
        ),
      ],
    );
  }
}
