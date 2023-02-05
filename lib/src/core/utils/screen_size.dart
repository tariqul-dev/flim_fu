import 'package:flutter/material.dart';


class ScreenSize {
  Size? _size;
  final BuildContext context;
  ScreenSize({required this.context}) {
    _size = MediaQuery.of(context).size;
  }

  double? get screenHeight => _size?.height;

  double? get screenWidth => _size?.width;

  double? get halfScreenHeight => _size!.height * 0.5;
  double? get halfScreenWidth => _size!.width * 0.5;

  SizedBox get verySmallHightSizedBox => const SizedBox(
        height: 5,
      );

  SizedBox get smallHeightSizedBox => const SizedBox(
        height: 10,
      );

  SizedBox get mediumHeightSizedBox => const SizedBox(
        height: 20,
      );

  SizedBox get verySmallWidthSizedBox => const SizedBox(
        width: 5,
      );

  SizedBox get smallWidthSizedBox => const SizedBox(
        width: 10,
      );

  SizedBox get mediumWidthSizedBox => const SizedBox(
        width: 20,
      );
}
