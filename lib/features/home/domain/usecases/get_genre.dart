import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/home/domain/entities/genre.dart';
import 'package:movie_app/features/home/domain/repository/movie_repository.dart';

class GetGenreUseCase implements UseCase<DataState<List<GenreEntity>>, void> {
  final MovieRepository _movieRepository;

  GetGenreUseCase(this._movieRepository);

  @override
  Future<DataState<List<GenreEntity>>> call({void params}) {
    return _movieRepository.getGenres();
  }
}
