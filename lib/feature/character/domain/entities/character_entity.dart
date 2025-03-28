import 'package:equatable/equatable.dart';

import 'location.dart';

class CharacterEntity extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final Location origin;
  final String image;

  const CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.origin,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, status, species, origin, image];
}
