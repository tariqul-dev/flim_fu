import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/movie_model.dart';
import '../models/all_movie_info_model.dart';

abstract class HomeMovieRemoteDataSource {
  /// Calls the
  /// https://api.themoviedb.org/3/movie/now_playing?api_key=3479c5fe9ddcf97176adc7bba656c7b5&language=en-US&page=1
  /// endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<AllMovieInfoModel>? getNowPlayingMovies();

  /// Calls the
  /// https://api.themoviedb.org/3/movie/popular?api_key=3479c5fe9ddcf97176adc7bba656c7b5&language=en-US&page=1
  /// endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<AllMovieInfoModel>? getPopularMovies();
}

typedef _ModelReturn = Future<dynamic>? Function(dynamic data);

class HomeMovieRemoteDataSourceImpl implements HomeMovieRemoteDataSource {
  final Dio client;

  const HomeMovieRemoteDataSourceImpl({required this.client});

  @override
  Future<AllMovieInfoModel>? getNowPlayingMovies() async {
    int pageNumber = 1;
    final response = await client.get(
      'https://api.themoviedb.org/3/movie/now_playing?api_key=3479c5fe9ddcf97176adc7bba656c7b5&language=en-US&page=$pageNumber',
    );
    pageNumber++;
    if (response.statusCode == 200) {
      // throw ServerException();
      return AllMovieInfoModel.fromJson(response.data);
      // return NowPlayingMovieModel.fromJson(json.decode(response.data));
    } else {
      throw ServerException();
    }
    // return await _getMovieFromRemoteServer(
    //     'https://api.themoviedb.org/3/movie/now_playing?api_key=3479c5fe9ddcf97176adc7bba656c7b5&language=en-US&page=1',
    //     (data) async => NowPlayingMovieModel.fromJson(
    //       json.decode(data),
    //     ),
    //   );
  }

  @override
  Future<AllMovieInfoModel>? getPopularMovies() async {
    final response = await client.get(
      'https://api.themoviedb.org/3/movie/popular?api_key=3479c5fe9ddcf97176adc7bba656c7b5&language=en-US&page=1',
    );
    if (response.statusCode == 200) {
      // throw ServerException();
      return AllMovieInfoModel.fromJson(response.data);
      // return NowPlayingMovieModel.fromJson(json.decode(response.data));
    } else {
      throw ServerException();
    }

    // return await _getMovieFromRemoteServer(
    //   'https://api.themoviedb.org/3/movie/popular?api_key=3479c5fe9ddcf97176adc7bba656c7b5&language=en-US&page=1',
    //   (data) async => PopularMovieModel.fromJson(
    //     json.decode(data),
    //   ),
    // );
  }

  _getMovieFromRemoteServer(String url, _ModelReturn model) async {
    final response = await client.get(url);
    print('json: ' + response.data);
    if (response.statusCode == 200) {
      return model(response.data);
    } else {
      throw ServerException();
    }
  }
}
