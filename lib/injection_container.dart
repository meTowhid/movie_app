import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/home/data/data_sources/remote/movie_api_service.dart';
import 'package:movie_app/features/home/data/repository/movie_repository_impl.dart';
import 'package:movie_app/features/home/domain/repository/movie_repository.dart';
import 'package:movie_app/features/home/domain/usecases/get_genre.dart';
import 'package:movie_app/features/home/domain/usecases/get_movie.dart';
import 'package:movie_app/features/home/presentation/bloc/movie/remote/remote_movie_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio()
    ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true)));

  // Dependencies
  sl.registerSingleton<MovieApiService>(MovieApiService(sl()));

  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetMovieUseCase>(GetMovieUseCase(sl()));
  sl.registerSingleton<GetGenreUseCase>(GetGenreUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteMoviesBloc>(() => RemoteMoviesBloc(sl(), sl()));
}
