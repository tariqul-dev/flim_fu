// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../../../core/models/movie_model.dart';
import '../../data/models/all_movie_info_model.dart';

class AllMovieInfo extends Equatable {
  DatesModel? dates;
  num? page;
  List<MovieModel>? movies;
  num? totalPages;
  num? totalResults;

  AllMovieInfo({
    this.dates,
    this.page,
    this.movies,
    this.totalPages,
    this.totalResults,
  });

  @override
  List<Object?> get props => [
        dates,
        page,
        movies,
        totalPages,
        totalResults,
      ];
}

class Dates extends Equatable {
  String? maximum;
  String? minimum;
  Dates({
    this.maximum,
    this.minimum,
  });

  @override
  List<Object?> get props => [
        maximum,
        minimum,
      ];
}
