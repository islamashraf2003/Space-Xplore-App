import 'package:json_annotation/json_annotation.dart';

part 'rocket_model.g.dart';

@JsonSerializable()
class RocketModel {
  final Height height;
  final Diameter diameter;
  final Mass mass;
  @JsonKey(name: "flickr_images")
  final List<String> flickrImages;
  final String name;
  final bool active;
  final String country;
  final String company;
  final String wikipedia;
  final String description;
  final String id;

  const RocketModel({
    required this.height,
    required this.diameter,
    required this.mass,
    required this.flickrImages,
    required this.name,
    required this.active,
    required this.country,
    required this.company,
    required this.wikipedia,
    required this.description,
    required this.id,
  });

  factory RocketModel.fromJson(json) {
    return _$RocketModelFromJson(json);
  }
}

@JsonSerializable()
class Diameter {
  final double meters;
  final double feet;

  const Diameter({required this.meters, required this.feet});
  factory Diameter.fromJson(json) {
    return _$DiameterFromJson(json);
  }
}

@JsonSerializable()
class Height {
  final double meters;
  final double feet;

  const Height({required this.meters, required this.feet});
  factory Height.fromJson(json) {
    return _$HeightFromJson(json);
  }
}

@JsonSerializable()
class Mass {
  final int kg;
  final int lb;

  const Mass({required this.kg, required this.lb});

  factory Mass.fromJson(json) {
    return _$MassFromJson(json);
  }
}
