// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CityDTO _$$_CityDTOFromJson(Map<String, dynamic> json) => _$_CityDTO(
      id: json['id'] as int,
      name: json['name'] as String?,
      regionId: json['region_id'] as int?,
      lat: json['lat'],
      long: json['long'],
    );

Map<String, dynamic> _$$_CityDTOToJson(_$_CityDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'region_id': instance.regionId,
      'lat': instance.lat,
      'long': instance.long,
    };
