import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';
import 'package:movie_app/features/home/domain/repository/movie_repository.dart';

class GetMovieUseCase implements UseCase<DataState<List<MovieEntity>>,void>{
  
  final MovieRepository _movieRepository;

  GetMovieUseCase(this._movieRepository);
  
  @override
  Future<DataState<List<MovieEntity>>> call({void params}) {
    return _movieRepository.getMovies();
  }
  
}