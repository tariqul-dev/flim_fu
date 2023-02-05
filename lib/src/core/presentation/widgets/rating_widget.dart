import 'package:flutter/material.dart';

import 'text_widgets.dart';
import '../../utils/screen_size.dart';

class RatingWidget extends StatelessWidget {
  final num rating;
  final ScreenSize screenSize;
  const RatingWidget({
    super.key,
    required this.screenSize,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        screenSize.verySmallWidthSizedBox,
        TitleSmalltWidget(
          subtitle: '${rating.toStringAsFixed(1)}/10 IMDb',
        ),
      ],
    );
  }
}
