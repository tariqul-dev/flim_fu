import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/text_widgets.dart';


class GenesWidget extends StatelessWidget {
  const GenesWidget({
    super.key,
    required this.genName,
  });

  final String genName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromARGB(255, 202, 185, 231),
      ),
      child: Center(
        child: TitleSmalltWidget(
          subtitle: genName,
        ),
      ),
    );
  }
}
