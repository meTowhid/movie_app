import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/home/domain/entities/genre.dart';
import 'package:movie_app/features/home/domain/usecases/get_genre.dart';
import 'package:movie_app/features/home/domain/usecases/get_movie.dart';
import 'package:movie_app/features/home/presentation/bloc/movie/remote/remote_movie_event.dart';
import 'package:movie_app/features/home/presentation/bloc/movie/remote/remote_movie_state.dart';

class RemoteMoviesBloc extends Bloc<RemoteMoviesEvent, RemoteMoviesState> {
  final GetMovieUseCase _getMovieUseCase;
  final GetGenreUseCase _getGenreUseCase;

  RemoteMoviesBloc(
    this._getMovieUseCase,
    this._getGenreUseCase,
  ) : super(const RemoteMoviesLoading()) {
    on<GetMovies>(onGetMovies);
  }

  void onGetMovies(GetMovies event, Emitter<RemoteMoviesState> emit) async {
    List<GenreEntity>? genres = state.genres;
    if (state.genres == null) {
      final response = await _getGenreUseCase.call();
      if (response is DataSuccess) genres = response.data;
    }

    print(genres);

    final dataState = await _getMovieUseCase.call();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteMoviesDone(dataState.data!, genres ?? []));
    }

    if (dataState is DataFailed) {
      emit(RemoteMoviesError(dataState.error!));
    }
  }
}
