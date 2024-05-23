// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipModel _$ShipModelFromJson(Map<String, dynamic> json) => ShipModel(
      shipId: json['id'] as String?,
      shipName: json['name'] as String?,
      shipType: json['type'] as String?,
      active: json['active'] as bool?,
      weightKg: (json['mass_kg'] as num?)?.toInt(),
      yearBuilt: (json['year_built'] as num?)?.toInt(),
      homePort: json['home_port'] as String?,
      link: json['link'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ShipModelToJson(ShipModel instance) => <String, dynamic>{
      'id': instance.shipId,
      'name': instance.shipName,
      'type': instance.shipType,
      'active': instance.active,
      'mass_kg': instance.weightKg,
      'year_built': instance.yearBuilt,
      'home_port': instance.homePort,
      'link': instance.link,
      'image': instance.image,
    };
