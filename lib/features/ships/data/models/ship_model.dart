import 'package:json_annotation/json_annotation.dart';

part 'ship_model.g.dart';

@JsonSerializable()
class ShipModel {
  @JsonKey(name: 'id')
  String? shipId;
  @JsonKey(name: 'name')
  String? shipName;
  @JsonKey(name: 'type')
  String? shipType;
  bool? active;
  @JsonKey(name: 'mass_kg')
  int? weightKg;
  @JsonKey(name: 'year_built')
  int? yearBuilt;
  @JsonKey(name: 'home_port')
  String? homePort;
  String? link;
  String? image;

  ShipModel({
    this.shipId,
    this.shipName,
    this.shipType,
    this.active,
    this.weightKg,
    this.yearBuilt,
    this.homePort,
    this.link,
    this.image,
  });

  factory ShipModel.fromJson(Map<String, dynamic> json) =>
      _$ShipModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShipModelToJson(this);
}
