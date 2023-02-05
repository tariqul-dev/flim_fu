// ignore_for_file: must_be_immutable

import '../../../../core/models/movie_model.dart';
import '../../../../core/utils/key_helper.dart';
import '../../domain/entities/bookmark_movie.dart';

class BookmarkMovieModel extends BookmarkMovie {
  BookmarkMovieModel({
    String? backdropPath,
    List<GenresModel>? genres,
    num? id,
    String? originalTitle,
    num? runtime,
    num? voteAverage,
  }) : super(
          backdropPath: backdropPath,
          genres: genres,
          id: id,
          originalTitle: originalTitle,
          runtime: runtime,
          voteAverage: voteAverage,
        );

  BookmarkMovieModel.fromJson(Map<String, dynamic> json) {

    List<String> genNameList = json[gensKey].toString().split(',');

    final List<GenresModel> gens = [];
    for(var name in genNameList){
      gens.add(
        GenresModel(
          name: name,
        ),
      );
    }


    id = json[movieIdKey].toInt();
    originalTitle = json[movieTitleKey];
    runtime = json[durationKey].toInt();
    genres = gens;
    voteAverage = json[ratingKey];
    backdropPath = json[imgPathKey];
  }

  

  Map<String, dynamic> toJson() {
    List<String> genNameList = [];
    for (var gen in genres!) {
      genNameList.add(gen.name!);
    }


    return {
      movieIdKey: id,
      movieTitleKey: originalTitle,
      durationKey: runtime,
      gensKey: genNameList.join(','),
      ratingKey: voteAverage,
      imgPathKey: backdropPath,
    };
  }
}

class GenresBookmarkModel extends GenresModel {
  GenresBookmarkModel({
    String? name,
    num? id,
  }) : super(id: id, name: name);

  GenresBookmarkModel.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
  }
  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
