// ignore_for_file: invalid_annotation_target

import 'package:europharm_flutter/network/models/city_dto.dart';
import 'package:europharm_flutter/network/models/point_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_dto.freezed.dart';
part 'order_dto.g.dart';

@freezed
class OrderDTO with _$OrderDTO {
  const factory OrderDTO({
    required int id,
    @JsonKey(name: 'crossdocking_id') int? crossdockingId,
    @JsonKey(name: 'crossdocking_city_id') int? crossdockingCityId,
    @JsonKey(name: 'crossdocking_number') int? crossdockingNumber,
    @JsonKey(name: 'crossdocking_name') String? crossdockName,
    @JsonKey(name: 'crossdocking_lat') String? crossdockLat,
    @JsonKey(name: 'crossdocking_long') String? crossdockLong,
    dynamic day, // FIXME
    String? description,
    @JsonKey(name: 'region_name') String? regionName,
    String? from,
    String? to,
    @JsonKey(name: 'from_lat') double? fromLat,
    @JsonKey(name: 'from_long') double? fromLong,
    @JsonKey(name: 'to_lat') double? toLat,
    @JsonKey(name: 'to_long') double? toLong,
    String? status,
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'end_date') DateTime? endDate,
    String? payment,
    @JsonKey(name: 'from_city_id') CityDTO? fromCity,
    @JsonKey(name: 'to_city_id') CityDTO? toCity,
    List<PointDTO?>? points,
    @JsonKey(name: 'count_points') int? countPoints,
    @JsonKey(name: 'order_status') OrderStatusDTO? orderStatus,
    // String? status,
    @Default(false) bool isCurrent,
    String? address,
    TransportDTO? transport,
  }) = _OrderDTO;

  factory OrderDTO.fromJson(Map<String, dynamic> json) =>
      _$OrderDTOFromJson(json);
}

@freezed
class OrderStatusDTO with _$OrderStatusDTO {
  const factory OrderStatusDTO({
    required int id,
    @JsonKey(name: 'order_id') required int orderId,
    String? status,
    @JsonKey(name: 'stop_reason') String? stopReason,
    @JsonKey(name: 'stop_timer') DateTime? stopTimer,
    String? order,
    @JsonKey(name: 'order_status') String? orderStatus,
  }) = _OrderStatusDTO;

  factory OrderStatusDTO.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusDTOFromJson(json);
}

@freezed
class TransportDTO with _$TransportDTO {
  const factory TransportDTO({
    required int id,
    TransportModelDTO? model,
    String? number,

  }) = _TransportDTO;

  factory TransportDTO.fromJson(Map<String, dynamic> json) =>
      _$TransportDTOFromJson(json);
}

@freezed
class TransportModelDTO with _$TransportModelDTO {
  const factory TransportModelDTO({
    required int id,
    String? name,

  }) = _TransportModelDTO;

  factory TransportModelDTO.fromJson(Map<String, dynamic> json) =>
      _$TransportModelDTOFromJson(json);
}

