// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'city_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CityDTO _$CityDTOFromJson(Map<String, dynamic> json) {
  return _CityDTO.fromJson(json);
}

/// @nodoc
mixin _$CityDTO {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'region_id')
  int? get regionId => throw _privateConstructorUsedError;
  dynamic get lat => throw _privateConstructorUsedError; // FIXME
  dynamic get long => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityDTOCopyWith<CityDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityDTOCopyWith<$Res> {
  factory $CityDTOCopyWith(CityDTO value, $Res Function(CityDTO) then) =
      _$CityDTOCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? name,
      @JsonKey(name: 'region_id') int? regionId,
      dynamic lat,
      dynamic long});
}

/// @nodoc
class _$CityDTOCopyWithImpl<$Res> implements $CityDTOCopyWith<$Res> {
  _$CityDTOCopyWithImpl(this._value, this._then);

  final CityDTO _value;
  // ignore: unused_field
  final $Res Function(CityDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? regionId = freezed,
    Object? lat = freezed,
    Object? long = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      regionId: regionId == freezed
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as dynamic,
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_CityDTOCopyWith<$Res> implements $CityDTOCopyWith<$Res> {
  factory _$$_CityDTOCopyWith(
          _$_CityDTO value, $Res Function(_$_CityDTO) then) =
      __$$_CityDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? name,
      @JsonKey(name: 'region_id') int? regionId,
      dynamic lat,
      dynamic long});
}

/// @nodoc
class __$$_CityDTOCopyWithImpl<$Res> extends _$CityDTOCopyWithImpl<$Res>
    implements _$$_CityDTOCopyWith<$Res> {
  __$$_CityDTOCopyWithImpl(_$_CityDTO _value, $Res Function(_$_CityDTO) _then)
      : super(_value, (v) => _then(v as _$_CityDTO));

  @override
  _$_CityDTO get _value => super._value as _$_CityDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? regionId = freezed,
    Object? lat = freezed,
    Object? long = freezed,
  }) {
    return _then(_$_CityDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      regionId: regionId == freezed
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as dynamic,
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CityDTO implements _CityDTO {
  const _$_CityDTO(
      {required this.id,
      this.name,
      @JsonKey(name: 'region_id') this.regionId,
      this.lat,
      this.long});

  factory _$_CityDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CityDTOFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'region_id')
  final int? regionId;
  @override
  final dynamic lat;
// FIXME
  @override
  final dynamic long;

  @override
  String toString() {
    return 'CityDTO(id: $id, name: $name, regionId: $regionId, lat: $lat, long: $long)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CityDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.regionId, regionId) &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.long, long));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(regionId),
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(long));

  @JsonKey(ignore: true)
  @override
  _$$_CityDTOCopyWith<_$_CityDTO> get copyWith =>
      __$$_CityDTOCopyWithImpl<_$_CityDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CityDTOToJson(this);
  }
}

abstract class _CityDTO implements CityDTO {
  const factory _CityDTO(
      {required final int id,
      final String? name,
      @JsonKey(name: 'region_id') final int? regionId,
      final dynamic lat,
      final dynamic long}) = _$_CityDTO;

  factory _CityDTO.fromJson(Map<String, dynamic> json) = _$_CityDTO.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'region_id')
  int? get regionId => throw _privateConstructorUsedError;
  @override
  dynamic get lat => throw _privateConstructorUsedError;
  @override // FIXME
  dynamic get long => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CityDTOCopyWith<_$_CityDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
