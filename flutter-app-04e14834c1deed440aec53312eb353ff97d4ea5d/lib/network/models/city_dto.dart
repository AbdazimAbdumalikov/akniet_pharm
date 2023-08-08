// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_dto.freezed.dart';
part 'city_dto.g.dart';

@freezed
class CityDTO with _$CityDTO {
  const factory CityDTO({
    required int id,
    String? name,
    @JsonKey(name: 'region_id') int? regionId,
    dynamic lat, // FIXME
    dynamic long,
  }) = _CityDTO;

  factory CityDTO.fromJson(Map<String, dynamic> json) =>
      _$CityDTOFromJson(json);
}
