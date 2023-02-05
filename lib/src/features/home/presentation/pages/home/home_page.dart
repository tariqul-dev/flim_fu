import 'package:flutter/material.dart';

import 'widgets/main_widget.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainWidget();
  }
}
