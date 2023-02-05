import 'package:flim_fu/injection_container.dart';
import 'package:flim_fu/src/features/bookmark/presentation/bloc/movie_bookmark_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/core/router/route_generator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieBookmarkBloc>(),
      child: MaterialApp(
        title: 'Flim Fu',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: RouteGenerator.generatedRoute,
      ),
    );
  }
}
