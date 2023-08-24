import 'package:floor/floor.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';

class MovieResponse {
  final List<MovieModel> results;

  MovieResponse(this.results);

  factory MovieResponse.fromJson(Map<String, dynamic> map) {
    return MovieResponse(
      (map['results'] as List).map((e) => MovieModel.fromJson(e)).toList(),
    );
  }
}

@Entity(tableName: 'movie', primaryKeys: ['id'])
class MovieModel extends MovieEntity {
  const MovieModel({
    int? id,
    int? vote,
    String? title,
    String? description,
    String? image,
    String? releaseDate,
  }) : super(
          id: id,
          vote: vote,
          title: title,
          description: description,
          image: image,
          releaseDate: releaseDate,
        );

  factory MovieModel.fromJson(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] as int?,
      vote: map['vote_count'] as int?,
      title: map['title'] ?? '',
      description: map['overview'] ?? '',
      image: imageBaseUrl + map['poster_path'],
      releaseDate: map['release_date'] ?? '',
    );
  }

  factory MovieModel.fromEntity(MovieEntity entity) {
    return MovieModel(
      id: entity.id,
      vote: entity.vote,
      title: entity.title,
      description: entity.description,
      image: entity.image,
      releaseDate: entity.releaseDate,
    );
  }
}
