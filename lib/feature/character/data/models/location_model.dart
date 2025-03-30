import '../../../../core/common/utils/typedefs.dart';
import '../../domain/entities/location.dart';

class LocationModel extends Location {
  const LocationModel({
    required super.name,
    required super.url,
  });

  factory LocationModel.fromJson(DataMap json) => LocationModel(
      name: json['name'],
      url: json['url']
  );

  DataMap toJson() => {
    'name': name,
    'url': url
  };
}