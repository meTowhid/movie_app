import 'package:dio/dio.dart';
import 'package:movie_app/features/home/data/models/genre.dart';
import 'package:movie_app/features/home/data/models/movie.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/constants.dart';

part 'movie_api_service.g.dart';

@RestApi(baseUrl: baseURL)
abstract class MovieApiService {
  factory MovieApiService(Dio dio) = _MovieApiService;

  @GET('/discover/movie')
  Future<HttpResponse<MovieResponse>> getMovies({
    @Header("Authorization") String? apiKey,
    @Query("include_adult") bool? includeAdult,
    @Query("include_video") bool? includeVideo,
    @Query("language") String? language,
    @Query("page") int? page,
    @Query("sort_by") String? sortBy,
  });

  @GET('/genre/movie/list')
  Future<HttpResponse<GenreResponse>> getGenres({
    @Header("Authorization") String? apiKey,
    @Query("language") String? language,
  });
}
