import 'package:movie_app/features/home/domain/entities/genre.dart';

class GenreResponse {
  final List<GenreModel> genres;

  GenreResponse(this.genres);

  factory GenreResponse.fromJson(Map<String, dynamic> map) {
    return GenreResponse(
      (map['genres'] as List).map((e) => GenreModel.fromJson(e)).toList(),
    );
  }
}

class GenreModel extends GenreEntity {
  const GenreModel({int? id, String? name}) : super(id: id, name: name);

  factory GenreModel.fromJson(Map<String, dynamic> map) {
    return GenreModel(id: map['id'] ?? 0, name: map['name'] ?? "");
  }

  factory GenreModel.fromEntity(GenreEntity entity) {
    return GenreModel(id: entity.id, name: entity.name);
  }
}
