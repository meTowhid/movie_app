import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/home/domain/entities/genre.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<DataState<List<GenreEntity>>> getGenres();

  Future<DataState<List<MovieEntity>>> getMovies();
}
