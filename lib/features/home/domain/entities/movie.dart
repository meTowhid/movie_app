import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int? id, vote;
  final String? title, description, image, releaseDate;

  const MovieEntity({
    this.id,
    this.vote,
    this.title,
    this.description,
    this.image,
    this.releaseDate,
  });

  @override
  List<Object?> get props {
    return [
      id,
      vote,
      title,
      image,
      description,
      releaseDate,
    ];
  }
}
