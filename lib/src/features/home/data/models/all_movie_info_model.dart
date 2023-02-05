// ignore_for_file: must_be_immutable

import '../../../../core/models/movie_model.dart';
import '../../domain/entities/all_movie_info.dart';

class AllMovieInfoModel extends AllMovieInfo {
  AllMovieInfoModel({
    DatesModel? dates,
    num? page,
    List<MovieModel>? movies,
    num? totalPages,
    num? totalResults,
  });

  AllMovieInfoModel.fromJson(dynamic json) {
    dates = json['dates'] != null ? DatesModel.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      movies = [];
      json['results'].forEach((v) {
        movies?.add(MovieModel?.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  AllMovieInfoModel copyWith({
    DatesModel? dates,
    num? page,
    List<MovieModel>? movies,
    num? totalPages,
    num? totalResults,
  }) =>
      AllMovieInfoModel(
        dates: dates ?? this.dates,
        page: page ?? this.page,
        movies: movies ?? this.movies,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dates != null) {
      map['dates'] = dates?.toJson();
    }
    map['page'] = page;
    if (movies != null) {
      map['results'] = movies?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}

class DatesModel extends Dates {
  DatesModel({
    this.maximum,
    this.minimum,
  });

  DatesModel.fromJson(dynamic json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
  String? maximum;
  String? minimum;
  DatesModel copyWith({
    String? maximum,
    String? minimum,
  }) =>
      DatesModel(
        maximum: maximum ?? this.maximum,
        minimum: minimum ?? this.minimum,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maximum'] = maximum;
    map['minimum'] = minimum;
    return map;
  }
}
