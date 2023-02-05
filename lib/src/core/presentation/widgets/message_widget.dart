import 'package:flutter/material.dart';

import 'text_widgets.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  const MessageWidget({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TitleMediumWidget(title: message),
    );
  }
}
