import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/domain/entities/genre.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';

abstract class RemoteMoviesState extends Equatable {
  final List<MovieEntity>? movies;
  final List<GenreEntity>? genres;
  final DioException? error;

  const RemoteMoviesState({this.movies, this.genres, this.error});

  @override
  List<Object> get props => [movies!, error!, genres!];
}

class RemoteMoviesLoading extends RemoteMoviesState {
  const RemoteMoviesLoading();
}

class RemoteMoviesDone extends RemoteMoviesState {
  const RemoteMoviesDone(
    List<MovieEntity> movie,
    List<GenreEntity> genre,
  ) : super(movies: movie);
}

class RemoteMoviesError extends RemoteMoviesState {
  const RemoteMoviesError(DioException error) : super(error: error);
}
