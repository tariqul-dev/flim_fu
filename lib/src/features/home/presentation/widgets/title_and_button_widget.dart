import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/text_widgets.dart';

// ignore: must_be_immutable
class TitileAndButtonWidget extends StatelessWidget {
  final String title;
  VoidCallback? onTap;

  TitileAndButtonWidget({
    required this.title,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleLargeWidget(title: title),
        OutlinedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          )),
          child: const TitleSmalltWidget(subtitle: 'See more'),
        ),
      ],
    );
  }
}
