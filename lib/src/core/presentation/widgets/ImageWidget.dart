import 'package:flutter/material.dart';

import '../../utils/urls.dart';

// ignore: must_be_immutable
class ImageWidget extends StatelessWidget {
  final String path;
  double elevation;
  double? height;
  double? width;
  ImageWidget({
    required this.path,
    this.elevation = 5,
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          '$imageBaseUrl/$path',
          fit: BoxFit.cover,
          height: height,
          width: width,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
