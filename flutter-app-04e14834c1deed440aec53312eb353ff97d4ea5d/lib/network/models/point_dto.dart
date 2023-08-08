// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'point_dto.freezed.dart';
part 'point_dto.g.dart';

@freezed
class PointDTO with _$PointDTO {
  const factory PointDTO({
    required int id,
    String? name,
    String? address,
    @JsonKey(name: 'crossdocking_id') String? crossdockingId,
    @JsonKey(name: 'crossdocking_name') String? crossdockName,
    @JsonKey(name: 'crossdocking_lat') String? crossdockLat,
    @JsonKey(name: 'crossdocking_long') String? crossdockLong,
    /*
    "crossdocking_id": "402",
    "crossdocking_name": "Алматы",
    "crossdocking_lat": "76.77660355",
    "crossdocking_long": "43.23320956",
     */
    String? status,
    DateTime? date,
    String? from,
    String? to,
    String? lat,
    String? long,
    dynamic type,
    dynamic avatar,
    @JsonKey(name: 'count_products') int? countProducts,
    @JsonKey(name: 'created_at') String? createdAt,
    List<ProductDTO>? products,
    List<ContainerDTO>? containers,
  }) = _PointDTO;

  factory PointDTO.fromJson(Map<String, dynamic> json) =>
      _$PointDTOFromJson(json);
}

@freezed
class ProductDTO with _$ProductDTO {
  const factory ProductDTO({
    required int id,
    int? point,
    String? name,
    String? code,
    String? status,

    // @JsonKey(name: 'created_at') String? createdAt,
  }) = _ProductDTO;

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);
}


@unfreezed
class ContainerDTO with _$ContainerDTO {
 factory ContainerDTO({
    required int id,
    @JsonKey(name: "point_id") int? pointId,
    String? code,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @Default(false) bool isScanned,
    int? status,

    // @JsonKey(name: 'created_at') String? createdAt,
  }) = _ContainerDTO;

  factory ContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$ContainerDTOFromJson(json);
}


/*
  final int? id;
  final int? point;
  final String? name;
  final String? code;
  final String? status;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        point: json["point"],
        name: json["name"],
        code: json["code"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );
}
*/
