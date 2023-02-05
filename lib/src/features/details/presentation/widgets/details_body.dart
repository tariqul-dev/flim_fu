import 'package:flutter/material.dart';

import '../../../../core/entities/movie.dart';
import '../../../../core/presentation/widgets/text_widgets.dart';
import '../../../../core/utils/screen_size.dart';
import 'genes_widget.dart';
import 'title_bottom.dart';
import 'title_list_tile.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
    required this.movie,
    required this.screenSize,
  });

  final Movie movie;
  final ScreenSize screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleListTile(movie: movie, screenSize: screenSize),
          SizedBox(
            height: 50,
            width: screenSize.screenWidth,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movie.genres!.length,
              itemBuilder: (context, index) => GenesWidget(
                genName: movie.genres![index].name!,
              ),
            ),
          ),
          TitleBottom(movie: movie),
          screenSize.mediumHeightSizedBox,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleLargeWidget(title: 'Description'),
                screenSize.smallHeightSizedBox,
                DescriptionTextWidget(
                  description: movie.overview!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
