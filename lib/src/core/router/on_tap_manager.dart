import 'package:flutter/material.dart';

class Goto {
  static navigate(
    BuildContext context, {
    required String routeName,
    dynamic arguments,
  }) {
    Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static back(BuildContext context) {
    Navigator.pop(context);
  }
}
