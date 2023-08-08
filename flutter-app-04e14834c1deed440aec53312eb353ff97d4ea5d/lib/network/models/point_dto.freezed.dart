// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'point_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PointDTO _$PointDTOFromJson(Map<String, dynamic> json) {
  return _PointDTO.fromJson(json);
}

/// @nodoc
mixin _$PointDTO {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'crossdocking_id')
  String? get crossdockingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'crossdocking_name')
  String? get crossdockName => throw _privateConstructorUsedError;
  @JsonKey(name: 'crossdocking_lat')
  String? get crossdockLat => throw _privateConstructorUsedError;
  @JsonKey(name: 'crossdocking_long')
  String? get crossdockLong =>
      throw _privateConstructorUsedError; /*
    "crossdocking_id": "402",
    "crossdocking_name": "Алматы",
    "crossdocking_lat": "76.77660355",
    "crossdocking_long": "43.23320956",
     */
  String? get status => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  String? get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  String? get lat => throw _privateConstructorUsedError;
  String? get long => throw _privateConstructorUsedError;
  dynamic get type => throw _privateConstructorUsedError;
  dynamic get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'count_products')
  int? get countProducts => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  List<ProductDTO>? get products => throw _privateConstructorUsedError;
  List<ContainerDTO>? get containers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointDTOCopyWith<PointDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointDTOCopyWith<$Res> {
  factory $PointDTOCopyWith(PointDTO value, $Res Function(PointDTO) then) =
      _$PointDTOCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? name,
      String? address,
      @JsonKey(name: 'crossdocking_id') String? crossdockingId,
      @JsonKey(name: 'crossdocking_name') String? crossdockName,
      @JsonKey(name: 'crossdocking_lat') String? crossdockLat,
      @JsonKey(name: 'crossdocking_long') String? crossdockLong,
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
      List<ContainerDTO>? containers});
}

/// @nodoc
class _$PointDTOCopyWithImpl<$Res> implements $PointDTOCopyWith<$Res> {
  _$PointDTOCopyWithImpl(this._value, this._then);

  final PointDTO _value;
  // ignore: unused_field
  final $Res Function(PointDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? crossdockingId = freezed,
    Object? crossdockName = freezed,
    Object? crossdockLat = freezed,
    Object? crossdockLong = freezed,
    Object? status = freezed,
    Object? date = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? lat = freezed,
    Object? long = freezed,
    Object? type = freezed,
    Object? avatar = freezed,
    Object? countProducts = freezed,
    Object? createdAt = freezed,
    Object? products = freezed,
    Object? containers = freezed,
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
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      crossdockingId: crossdockingId == freezed
          ? _value.crossdockingId
          : crossdockingId // ignore: cast_nullable_to_non_nullable
              as String?,
      crossdockName: crossdockName == freezed
          ? _value.crossdockName
          : crossdockName // ignore: cast_nullable_to_non_nullable
              as String?,
      crossdockLat: crossdockLat == freezed
          ? _value.crossdockLat
          : crossdockLat // ignore: cast_nullable_to_non_nullable
              as String?,
      crossdockLong: crossdockLong == freezed
          ? _value.crossdockLong
          : crossdockLong // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as dynamic,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as dynamic,
      countProducts: countProducts == freezed
          ? _value.countProducts
          : countProducts // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDTO>?,
      containers: containers == freezed
          ? _value.containers
          : containers // ignore: cast_nullable_to_non_nullable
              as List<ContainerDTO>?,
    ));
  }
}

/// @nodoc
abstract class _$$_PointDTOCopyWith<$Res> implements $PointDTOCopyWith<$Res> {
  factory _$$_PointDTOCopyWith(
          _$_PointDTO value, $Res Function(_$_PointDTO) then) =
      __$$_PointDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? name,
      String? address,
      @JsonKey(name: 'crossdocking_id') String? crossdockingId,
      @JsonKey(name: 'crossdocking_name') String? crossdockName,
      @JsonKey(name: 'crossdocking_lat') String? crossdockLat,
      @JsonKey(name: 'crossdocking_long') String? crossdockLong,
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
      List<ContainerDTO>? containers});
}

/// @nodoc
class __$$_PointDTOCopyWithImpl<$Res> extends _$PointDTOCopyWithImpl<$Res>
    implements _$$_PointDTOCopyWith<$Res> {
  __$$_PointDTOCopyWithImpl(
      _$_PointDTO _value, $Res Function(_$_PointDTO) _then)
      : super(_value, (v) => _then(v as _$_PointDTO));

  @override
  _$_PointDTO get _value => super._value as _$_PointDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? crossdockingId = freezed,
    Object? crossdockName = freezed,
    Object? crossdockLat = freezed,
    Object? crossdockLong = freezed,
    Object? status = freezed,
    Object? date = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? lat = freezed,
    Object? long = freezed,
    Object? type = freezed,
    Object? avatar = freezed,
    Object? countProducts = freezed,
    Object? createdAt = freezed,
    Object? products = freezed,
    Object? containers = freezed,
  }) {
    return _then(_$_PointDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      crossdockingId: crossdockingId == freezed
          ? _value.crossdockingId
          : crossdockingId // ignore: cast_nullable_to_non_nullable
              as String?,
      crossdockName: crossdockName == freezed
          ? _value.crossdockName
          : crossdockName // ignore: cast_nullable_to_non_nullable
              as String?,
      crossdockLat: crossdockLat == freezed
          ? _value.crossdockLat
          : crossdockLat // ignore: cast_nullable_to_non_nullable
              as String?,
      crossdockLong: crossdockLong == freezed
          ? _value.crossdockLong
          : crossdockLong // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as dynamic,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as dynamic,
      countProducts: countProducts == freezed
          ? _value.countProducts
          : countProducts // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDTO>?,
      containers: containers == freezed
          ? _value._containers
          : containers // ignore: cast_nullable_to_non_nullable
              as List<ContainerDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PointDTO implements _PointDTO {
  const _$_PointDTO(
      {required this.id,
      this.name,
      this.address,
      @JsonKey(name: 'crossdocking_id') this.crossdockingId,
      @JsonKey(name: 'crossdocking_name') this.crossdockName,
      @JsonKey(name: 'crossdocking_lat') this.crossdockLat,
      @JsonKey(name: 'crossdocking_long') this.crossdockLong,
      this.status,
      this.date,
      this.from,
      this.to,
      this.lat,
      this.long,
      this.type,
      this.avatar,
      @JsonKey(name: 'count_products') this.countProducts,
      @JsonKey(name: 'created_at') this.createdAt,
      final List<ProductDTO>? products,
      final List<ContainerDTO>? containers})
      : _products = products,
        _containers = containers;

  factory _$_PointDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PointDTOFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? address;
  @override
  @JsonKey(name: 'crossdocking_id')
  final String? crossdockingId;
  @override
  @JsonKey(name: 'crossdocking_name')
  final String? crossdockName;
  @override
  @JsonKey(name: 'crossdocking_lat')
  final String? crossdockLat;
  @override
  @JsonKey(name: 'crossdocking_long')
  final String? crossdockLong;
/*
    "crossdocking_id": "402",
    "crossdocking_name": "Алматы",
    "crossdocking_lat": "76.77660355",
    "crossdocking_long": "43.23320956",
     */
  @override
  final String? status;
  @override
  final DateTime? date;
  @override
  final String? from;
  @override
  final String? to;
  @override
  final String? lat;
  @override
  final String? long;
  @override
  final dynamic type;
  @override
  final dynamic avatar;
  @override
  @JsonKey(name: 'count_products')
  final int? countProducts;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  final List<ProductDTO>? _products;
  @override
  List<ProductDTO>? get products {
    final value = _products;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ContainerDTO>? _containers;
  @override
  List<ContainerDTO>? get containers {
    final value = _containers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PointDTO(id: $id, name: $name, address: $address, crossdockingId: $crossdockingId, crossdockName: $crossdockName, crossdockLat: $crossdockLat, crossdockLong: $crossdockLong, status: $status, date: $date, from: $from, to: $to, lat: $lat, long: $long, type: $type, avatar: $avatar, countProducts: $countProducts, createdAt: $createdAt, products: $products, containers: $containers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PointDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.crossdockingId, crossdockingId) &&
            const DeepCollectionEquality()
                .equals(other.crossdockName, crossdockName) &&
            const DeepCollectionEquality()
                .equals(other.crossdockLat, crossdockLat) &&
            const DeepCollectionEquality()
                .equals(other.crossdockLong, crossdockLong) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.from, from) &&
            const DeepCollectionEquality().equals(other.to, to) &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.long, long) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality()
                .equals(other.countProducts, countProducts) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._containers, _containers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(name),
        const DeepCollectionEquality().hash(address),
        const DeepCollectionEquality().hash(crossdockingId),
        const DeepCollectionEquality().hash(crossdockName),
        const DeepCollectionEquality().hash(crossdockLat),
        const DeepCollectionEquality().hash(crossdockLong),
        const DeepCollectionEquality().hash(status),
        const DeepCollectionEquality().hash(date),
        const DeepCollectionEquality().hash(from),
        const DeepCollectionEquality().hash(to),
        const DeepCollectionEquality().hash(lat),
        const DeepCollectionEquality().hash(long),
        const DeepCollectionEquality().hash(type),
        const DeepCollectionEquality().hash(avatar),
        const DeepCollectionEquality().hash(countProducts),
        const DeepCollectionEquality().hash(createdAt),
        const DeepCollectionEquality().hash(_products),
        const DeepCollectionEquality().hash(_containers)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_PointDTOCopyWith<_$_PointDTO> get copyWith =>
      __$$_PointDTOCopyWithImpl<_$_PointDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PointDTOToJson(this);
  }
}

abstract class _PointDTO implements PointDTO {
  const factory _PointDTO(
      {required final int id,
      final String? name,
      final String? address,
      @JsonKey(name: 'crossdocking_id') final String? crossdockingId,
      @JsonKey(name: 'crossdocking_name') final String? crossdockName,
      @JsonKey(name: 'crossdocking_lat') final String? crossdockLat,
      @JsonKey(name: 'crossdocking_long') final String? crossdockLong,
      final String? status,
      final DateTime? date,
      final String? from,
      final String? to,
      final String? lat,
      final String? long,
      final dynamic type,
      final dynamic avatar,
      @JsonKey(name: 'count_products') final int? countProducts,
      @JsonKey(name: 'created_at') final String? createdAt,
      final List<ProductDTO>? products,
      final List<ContainerDTO>? containers}) = _$_PointDTO;

  factory _PointDTO.fromJson(Map<String, dynamic> json) = _$_PointDTO.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get address => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'crossdocking_id')
  String? get crossdockingId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'crossdocking_name')
  String? get crossdockName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'crossdocking_lat')
  String? get crossdockLat => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'crossdocking_long')
  String? get crossdockLong => throw _privateConstructorUsedError;
  @override /*
    "crossdocking_id": "402",
    "crossdocking_name": "Алматы",
    "crossdocking_lat": "76.77660355",
    "crossdocking_long": "43.23320956",
     */
  String? get status => throw _privateConstructorUsedError;
  @override
  DateTime? get date => throw _privateConstructorUsedError;
  @override
  String? get from => throw _privateConstructorUsedError;
  @override
  String? get to => throw _privateConstructorUsedError;
  @override
  String? get lat => throw _privateConstructorUsedError;
  @override
  String? get long => throw _privateConstructorUsedError;
  @override
  dynamic get type => throw _privateConstructorUsedError;
  @override
  dynamic get avatar => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'count_products')
  int? get countProducts => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  List<ProductDTO>? get products => throw _privateConstructorUsedError;
  @override
  List<ContainerDTO>? get containers => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PointDTOCopyWith<_$_PointDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) {
  return _ProductDTO.fromJson(json);
}

/// @nodoc
mixin _$ProductDTO {
  int get id => throw _privateConstructorUsedError;
  int? get point => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDTOCopyWith<ProductDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDTOCopyWith<$Res> {
  factory $ProductDTOCopyWith(
          ProductDTO value, $Res Function(ProductDTO) then) =
      _$ProductDTOCopyWithImpl<$Res>;
  $Res call({int id, int? point, String? name, String? code, String? status});
}

/// @nodoc
class _$ProductDTOCopyWithImpl<$Res> implements $ProductDTOCopyWith<$Res> {
  _$ProductDTOCopyWithImpl(this._value, this._then);

  final ProductDTO _value;
  // ignore: unused_field
  final $Res Function(ProductDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? point = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductDTOCopyWith<$Res>
    implements $ProductDTOCopyWith<$Res> {
  factory _$$_ProductDTOCopyWith(
          _$_ProductDTO value, $Res Function(_$_ProductDTO) then) =
      __$$_ProductDTOCopyWithImpl<$Res>;
  @override
  $Res call({int id, int? point, String? name, String? code, String? status});
}

/// @nodoc
class __$$_ProductDTOCopyWithImpl<$Res> extends _$ProductDTOCopyWithImpl<$Res>
    implements _$$_ProductDTOCopyWith<$Res> {
  __$$_ProductDTOCopyWithImpl(
      _$_ProductDTO _value, $Res Function(_$_ProductDTO) _then)
      : super(_value, (v) => _then(v as _$_ProductDTO));

  @override
  _$_ProductDTO get _value => super._value as _$_ProductDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? point = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_ProductDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductDTO implements _ProductDTO {
  const _$_ProductDTO(
      {required this.id, this.point, this.name, this.code, this.status});

  factory _$_ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ProductDTOFromJson(json);

  @override
  final int id;
  @override
  final int? point;
  @override
  final String? name;
  @override
  final String? code;
  @override
  final String? status;

  @override
  String toString() {
    return 'ProductDTO(id: $id, point: $point, name: $name, code: $code, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.point, point) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(point),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_ProductDTOCopyWith<_$_ProductDTO> get copyWith =>
      __$$_ProductDTOCopyWithImpl<_$_ProductDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductDTOToJson(this);
  }
}

abstract class _ProductDTO implements ProductDTO {
  const factory _ProductDTO(
      {required final int id,
      final int? point,
      final String? name,
      final String? code,
      final String? status}) = _$_ProductDTO;

  factory _ProductDTO.fromJson(Map<String, dynamic> json) =
      _$_ProductDTO.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int? get point => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get code => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductDTOCopyWith<_$_ProductDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

ContainerDTO _$ContainerDTOFromJson(Map<String, dynamic> json) {
  return _ContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$ContainerDTO {
  int get id => throw _privateConstructorUsedError;
  set id(int value) => throw _privateConstructorUsedError;
  @JsonKey(name: "point_id")
  int? get pointId => throw _privateConstructorUsedError;
  @JsonKey(name: "point_id")
  set pointId(int? value) => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  set code(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  set createdAt(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  set updatedAt(String? value) => throw _privateConstructorUsedError;
  bool get isScanned => throw _privateConstructorUsedError;
  set isScanned(bool value) => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  set status(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContainerDTOCopyWith<ContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContainerDTOCopyWith<$Res> {
  factory $ContainerDTOCopyWith(
          ContainerDTO value, $Res Function(ContainerDTO) then) =
      _$ContainerDTOCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: "point_id") int? pointId,
      String? code,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt,
      bool isScanned,
      int? status});
}

/// @nodoc
class _$ContainerDTOCopyWithImpl<$Res> implements $ContainerDTOCopyWith<$Res> {
  _$ContainerDTOCopyWithImpl(this._value, this._then);

  final ContainerDTO _value;
  // ignore: unused_field
  final $Res Function(ContainerDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? pointId = freezed,
    Object? code = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isScanned = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      pointId: pointId == freezed
          ? _value.pointId
          : pointId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isScanned: isScanned == freezed
          ? _value.isScanned
          : isScanned // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_ContainerDTOCopyWith<$Res>
    implements $ContainerDTOCopyWith<$Res> {
  factory _$$_ContainerDTOCopyWith(
          _$_ContainerDTO value, $Res Function(_$_ContainerDTO) then) =
      __$$_ContainerDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: "point_id") int? pointId,
      String? code,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt,
      bool isScanned,
      int? status});
}

/// @nodoc
class __$$_ContainerDTOCopyWithImpl<$Res>
    extends _$ContainerDTOCopyWithImpl<$Res>
    implements _$$_ContainerDTOCopyWith<$Res> {
  __$$_ContainerDTOCopyWithImpl(
      _$_ContainerDTO _value, $Res Function(_$_ContainerDTO) _then)
      : super(_value, (v) => _then(v as _$_ContainerDTO));

  @override
  _$_ContainerDTO get _value => super._value as _$_ContainerDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? pointId = freezed,
    Object? code = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isScanned = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_ContainerDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      pointId: pointId == freezed
          ? _value.pointId
          : pointId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isScanned: isScanned == freezed
          ? _value.isScanned
          : isScanned // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContainerDTO implements _ContainerDTO {
  _$_ContainerDTO(
      {required this.id,
      @JsonKey(name: "point_id") this.pointId,
      this.code,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      this.isScanned = false,
      this.status});

  factory _$_ContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ContainerDTOFromJson(json);

  @override
  int id;
  @override
  @JsonKey(name: "point_id")
  int? pointId;
  @override
  String? code;
  @override
  @JsonKey(name: "created_at")
  String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @override
  @JsonKey()
  bool isScanned;
  @override
  int? status;

  @override
  String toString() {
    return 'ContainerDTO(id: $id, pointId: $pointId, code: $code, createdAt: $createdAt, updatedAt: $updatedAt, isScanned: $isScanned, status: $status)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_ContainerDTOCopyWith<_$_ContainerDTO> get copyWith =>
      __$$_ContainerDTOCopyWithImpl<_$_ContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContainerDTOToJson(this);
  }
}

abstract class _ContainerDTO implements ContainerDTO {
  factory _ContainerDTO(
      {required int id,
      @JsonKey(name: "point_id") int? pointId,
      String? code,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt,
      bool isScanned,
      int? status}) = _$_ContainerDTO;

  factory _ContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_ContainerDTO.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "point_id")
  int? get pointId => throw _privateConstructorUsedError;
  @override
  String? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;
  @override
  bool get isScanned => throw _privateConstructorUsedError;
  @override
  int? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ContainerDTOCopyWith<_$_ContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
