import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/movie_model.dart';

abstract class DetailsMovieRemoteDataSource {
  /// Calls the
  /// https://api.themoviedb.org/3/movie/<<movie_id>>?api_key=3479c5fe9ddcf97176adc7bba656c7b5&language=en-US
  /// endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<MovieModel>? getMovieDetails(int movieId);
}

typedef _ModelReturn = Future<dynamic>? Function(dynamic data);

class DetailsMovieRemoteDataSourceImpl implements DetailsMovieRemoteDataSource {
  final Dio client;

  const DetailsMovieRemoteDataSourceImpl({required this.client});

  @override
  Future<MovieModel>? getMovieDetails(int movieId) async {
    final response = await client.get(
      'https://api.themoviedb.org/3/movie/$movieId?api_key=3479c5fe9ddcf97176adc7bba656c7b5&language=en-US',
    );
    if (response.statusCode == 200) {
      // throw ServerException();
      return MovieModel.fromJson(response.data);
      // return NowPlayingMovieModel.fromJson(json.decode(response.data));
    } else {
      throw ServerException();
    }
    // return _getMovieFromRemoteServer(
    //     'https://api.themoviedb.org/3/movie/$movieId?api_key=3479c5fe9ddcf97176adc7bba656c7b5&language=en-US',
    //     (data) async => MovieDetailsModel.fromJson(
    //       json.decode(data),
    //     ),
    //   );
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
