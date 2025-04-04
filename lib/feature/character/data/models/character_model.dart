import '../../../../core/common/utils/typedefs.dart';
import '../../domain/entities/character_entity.dart';
import 'location_model.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.origin,
    required super.image,
  });

  factory CharacterModel.fromJson(DataMap json) => CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      origin: LocationModel.fromJson(json['origin']),
      image: json['image']
  );

  DataMap toJson() => {
    'id': id,
    'name': name,
    'status': status,
    'species': species,
    'origin': origin,
    'image': image
  };
}