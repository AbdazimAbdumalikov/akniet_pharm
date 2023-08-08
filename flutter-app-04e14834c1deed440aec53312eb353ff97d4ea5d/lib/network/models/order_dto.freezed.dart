// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderDTO _$OrderDTOFromJson(Map<String, dynamic> json) {
  return _OrderDTO.fromJson(json);
}

/// @nodoc
mixin _$OrderDTO {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'crossdocking_id')
  int? get crossdockingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'crossdocking_city_id')
  int? get crossdockingCityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'crossdocking_number')
  int? get crossdockingNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'crossdocking_name')
  String? get crossdockName => throw _privateConstructorUsedError;
  @JsonKey(name: 'crossdocking_lat')
  String? get crossdockLat => throw _privateConstructorUsedError;
  @JsonKey(name: 'crossdocking_long')
  String? get crossdockLong => throw _privateConstructorUsedError;
  dynamic get day => throw _privateConstructorUsedError; // FIXME
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'region_name')
  String? get regionName => throw _privateConstructorUsedError;
  String? get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_lat')
  double? get fromLat => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_long')
  double? get fromLong => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_lat')
  double? get toLat => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_long')
  double? get toLong => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get payment => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_city_id')
  CityDTO? get fromCity => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_city_id')
  CityDTO? get toCity => throw _privateConstructorUsedError;
  List<PointDTO?>? get points => throw _privateConstructorUsedError;
  @JsonKey(name: 'count_points')
  int? get countPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_status')
  OrderStatusDTO? get orderStatus =>
      throw _privateConstructorUsedError; // String? status,
  bool get isCurrent => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  TransportDTO? get transport => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDTOCopyWith<OrderDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDTOCopyWith<$Res> {
  factory $OrderDTOCopyWith(OrderDTO value, $Res Function(OrderDTO) then) =
      _$OrderDTOCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'crossdocking_id') int? crossdockingId,
      @JsonKey(name: 'crossdocking_city_id') int? crossdockingCityId,
      @JsonKey(name: 'crossdocking_number') int? crossdockingNumber,
      @JsonKey(name: 'crossdocking_name') String? crossdockName,
      @JsonKey(name: 'crossdocking_lat') String? crossdockLat,
      @JsonKey(name: 'crossdocking_long') String? crossdockLong,
      dynamic day,
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
      bool isCurrent,
      String? address,
      TransportDTO? transport});

  $CityDTOCopyWith<$Res>? get fromCity;
  $CityDTOCopyWith<$Res>? get toCity;
  $OrderStatusDTOCopyWith<$Res>? get orderStatus;
  $TransportDTOCopyWith<$Res>? get transport;
}

/// @nodoc
class _$OrderDTOCopyWithImpl<$Res> implements $OrderDTOCopyWith<$Res> {
  _$OrderDTOCopyWithImpl(this._value, this._then);

  final OrderDTO _value;
  // ignore: unused_field
  final $Res Function(OrderDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? crossdockingId = freezed,
    Object? crossdockingCityId = freezed,
    Object? crossdockingNumber = freezed,
    Object? crossdockName = freezed,
    Object? crossdockLat = freezed,
    Object? crossdockLong = freezed,
    Object? day = freezed,
    Object? description = freezed,
    Object? regionName = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? fromLat = freezed,
    Object? fromLong = freezed,
    Object? toLat = freezed,
    Object? toLong = freezed,
    Object? status = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? payment = freezed,
    Object? fromCity = freezed,
    Object? toCity = freezed,
    Object? points = freezed,
    Object? countPoints = freezed,
    Object? orderStatus = freezed,
    Object? isCurrent = freezed,
    Object? address = freezed,
    Object? transport = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      crossdockingId: crossdockingId == freezed
          ? _value.crossdockingId
          : crossdockingId // ignore: cast_nullable_to_non_nullable
              as int?,
      crossdockingCityId: crossdockingCityId == freezed
          ? _value.crossdockingCityId
          : crossdockingCityId // ignore: cast_nullable_to_non_nullable
              as int?,
      crossdockingNumber: crossdockingNumber == freezed
          ? _value.crossdockingNumber
          : crossdockingNumber // ignore: cast_nullable_to_non_nullable
              as int?,
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
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      regionName: regionName == freezed
          ? _value.regionName
          : regionName // ignore: cast_nullable_to_non_nullable
              as String?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      fromLat: fromLat == freezed
          ? _value.fromLat
          : fromLat // ignore: cast_nullable_to_non_nullable
              as double?,
      fromLong: fromLong == freezed
          ? _value.fromLong
          : fromLong // ignore: cast_nullable_to_non_nullable
              as double?,
      toLat: toLat == freezed
          ? _value.toLat
          : toLat // ignore: cast_nullable_to_non_nullable
              as double?,
      toLong: toLong == freezed
          ? _value.toLong
          : toLong // ignore: cast_nullable_to_non_nullable
              as double?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      payment: payment == freezed
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as String?,
      fromCity: fromCity == freezed
          ? _value.fromCity
          : fromCity // ignore: cast_nullable_to_non_nullable
              as CityDTO?,
      toCity: toCity == freezed
          ? _value.toCity
          : toCity // ignore: cast_nullable_to_non_nullable
              as CityDTO?,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<PointDTO?>?,
      countPoints: countPoints == freezed
          ? _value.countPoints
          : countPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatusDTO?,
      isCurrent: isCurrent == freezed
          ? _value.isCurrent
          : isCurrent // ignore: cast_nullable_to_non_nullable
              as bool,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      transport: transport == freezed
          ? _value.transport
          : transport // ignore: cast_nullable_to_non_nullable
              as TransportDTO?,
    ));
  }

  @override
  $CityDTOCopyWith<$Res>? get fromCity {
    if (_value.fromCity == null) {
      return null;
    }

    return $CityDTOCopyWith<$Res>(_value.fromCity!, (value) {
      return _then(_value.copyWith(fromCity: value));
    });
  }

  @override
  $CityDTOCopyWith<$Res>? get toCity {
    if (_value.toCity == null) {
      return null;
    }

    return $CityDTOCopyWith<$Res>(_value.toCity!, (value) {
      return _then(_value.copyWith(toCity: value));
    });
  }

  @override
  $OrderStatusDTOCopyWith<$Res>? get orderStatus {
    if (_value.orderStatus == null) {
      return null;
    }

    return $OrderStatusDTOCopyWith<$Res>(_value.orderStatus!, (value) {
      return _then(_value.copyWith(orderStatus: value));
    });
  }

  @override
  $TransportDTOCopyWith<$Res>? get transport {
    if (_value.transport == null) {
      return null;
    }

    return $TransportDTOCopyWith<$Res>(_value.transport!, (value) {
      return _then(_value.copyWith(transport: value));
    });
  }
}

/// @nodoc
abstract class _$$_OrderDTOCopyWith<$Res> implements $OrderDTOCopyWith<$Res> {
  factory _$$_OrderDTOCopyWith(
          _$_OrderDTO value, $Res Function(_$_OrderDTO) then) =
      __$$_OrderDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'crossdocking_id') int? crossdockingId,
      @JsonKey(name: 'crossdocking_city_id') int? crossdockingCityId,
      @JsonKey(name: 'crossdocking_number') int? crossdockingNumber,
      @JsonKey(name: 'crossdocking_name') String? crossdockName,
      @JsonKey(name: 'crossdocking_lat') String? crossdockLat,
      @JsonKey(name: 'crossdocking_long') String? crossdockLong,
      dynamic day,
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
      bool isCurrent,
      String? address,
      TransportDTO? transport});

  @override
  $CityDTOCopyWith<$Res>? get fromCity;
  @override
  $CityDTOCopyWith<$Res>? get toCity;
  @override
  $OrderStatusDTOCopyWith<$Res>? get orderStatus;
  @override
  $TransportDTOCopyWith<$Res>? get transport;
}

/// @nodoc
class __$$_OrderDTOCopyWithImpl<$Res> extends _$OrderDTOCopyWithImpl<$Res>
    implements _$$_OrderDTOCopyWith<$Res> {
  __$$_OrderDTOCopyWithImpl(
      _$_OrderDTO _value, $Res Function(_$_OrderDTO) _then)
      : super(_value, (v) => _then(v as _$_OrderDTO));

  @override
  _$_OrderDTO get _value => super._value as _$_OrderDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? crossdockingId = freezed,
    Object? crossdockingCityId = freezed,
    Object? crossdockingNumber = freezed,
    Object? crossdockName = freezed,
    Object? crossdockLat = freezed,
    Object? crossdockLong = freezed,
    Object? day = freezed,
    Object? description = freezed,
    Object? regionName = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? fromLat = freezed,
    Object? fromLong = freezed,
    Object? toLat = freezed,
    Object? toLong = freezed,
    Object? status = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? payment = freezed,
    Object? fromCity = freezed,
    Object? toCity = freezed,
    Object? points = freezed,
    Object? countPoints = freezed,
    Object? orderStatus = freezed,
    Object? isCurrent = freezed,
    Object? address = freezed,
    Object? transport = freezed,
  }) {
    return _then(_$_OrderDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      crossdockingId: crossdockingId == freezed
          ? _value.crossdockingId
          : crossdockingId // ignore: cast_nullable_to_non_nullable
              as int?,
      crossdockingCityId: crossdockingCityId == freezed
          ? _value.crossdockingCityId
          : crossdockingCityId // ignore: cast_nullable_to_non_nullable
              as int?,
      crossdockingNumber: crossdockingNumber == freezed
          ? _value.crossdockingNumber
          : crossdockingNumber // ignore: cast_nullable_to_non_nullable
              as int?,
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
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      regionName: regionName == freezed
          ? _value.regionName
          : regionName // ignore: cast_nullable_to_non_nullable
              as String?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      fromLat: fromLat == freezed
          ? _value.fromLat
          : fromLat // ignore: cast_nullable_to_non_nullable
              as double?,
      fromLong: fromLong == freezed
          ? _value.fromLong
          : fromLong // ignore: cast_nullable_to_non_nullable
              as double?,
      toLat: toLat == freezed
          ? _value.toLat
          : toLat // ignore: cast_nullable_to_non_nullable
              as double?,
      toLong: toLong == freezed
          ? _value.toLong
          : toLong // ignore: cast_nullable_to_non_nullable
              as double?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      payment: payment == freezed
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as String?,
      fromCity: fromCity == freezed
          ? _value.fromCity
          : fromCity // ignore: cast_nullable_to_non_nullable
              as CityDTO?,
      toCity: toCity == freezed
          ? _value.toCity
          : toCity // ignore: cast_nullable_to_non_nullable
              as CityDTO?,
      points: points == freezed
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<PointDTO?>?,
      countPoints: countPoints == freezed
          ? _value.countPoints
          : countPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatusDTO?,
      isCurrent: isCurrent == freezed
          ? _value.isCurrent
          : isCurrent // ignore: cast_nullable_to_non_nullable
              as bool,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      transport: transport == freezed
          ? _value.transport
          : transport // ignore: cast_nullable_to_non_nullable
              as TransportDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderDTO implements _OrderDTO {
  const _$_OrderDTO(
      {required this.id,
      @JsonKey(name: 'crossdocking_id') this.crossdockingId,
      @JsonKey(name: 'crossdocking_city_id') this.crossdockingCityId,
      @JsonKey(name: 'crossdocking_number') this.crossdockingNumber,
      @JsonKey(name: 'crossdocking_name') this.crossdockName,
      @JsonKey(name: 'crossdocking_lat') this.crossdockLat,
      @JsonKey(name: 'crossdocking_long') this.crossdockLong,
      this.day,
      this.description,
      @JsonKey(name: 'region_name') this.regionName,
      this.from,
      this.to,
      @JsonKey(name: 'from_lat') this.fromLat,
      @JsonKey(name: 'from_long') this.fromLong,
      @JsonKey(name: 'to_lat') this.toLat,
      @JsonKey(name: 'to_long') this.toLong,
      this.status,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
      this.payment,
      @JsonKey(name: 'from_city_id') this.fromCity,
      @JsonKey(name: 'to_city_id') this.toCity,
      final List<PointDTO?>? points,
      @JsonKey(name: 'count_points') this.countPoints,
      @JsonKey(name: 'order_status') this.orderStatus,
      this.isCurrent = false,
      this.address,
      this.transport})
      : _points = points;

  factory _$_OrderDTO.fromJson(Map<String, dynamic> json) =>
      _$$_OrderDTOFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'crossdocking_id')
  final int? crossdockingId;
  @override
  @JsonKey(name: 'crossdocking_city_id')
  final int? crossdockingCityId;
  @override
  @JsonKey(name: 'crossdocking_number')
  final int? crossdockingNumber;
  @override
  @JsonKey(name: 'crossdocking_name')
  final String? crossdockName;
  @override
  @JsonKey(name: 'crossdocking_lat')
  final String? crossdockLat;
  @override
  @JsonKey(name: 'crossdocking_long')
  final String? crossdockLong;
  @override
  final dynamic day;
// FIXME
  @override
  final String? description;
  @override
  @JsonKey(name: 'region_name')
  final String? regionName;
  @override
  final String? from;
  @override
  final String? to;
  @override
  @JsonKey(name: 'from_lat')
  final double? fromLat;
  @override
  @JsonKey(name: 'from_long')
  final double? fromLong;
  @override
  @JsonKey(name: 'to_lat')
  final double? toLat;
  @override
  @JsonKey(name: 'to_long')
  final double? toLong;
  @override
  final String? status;
  @override
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  @override
  final String? payment;
  @override
  @JsonKey(name: 'from_city_id')
  final CityDTO? fromCity;
  @override
  @JsonKey(name: 'to_city_id')
  final CityDTO? toCity;
  final List<PointDTO?>? _points;
  @override
  List<PointDTO?>? get points {
    final value = _points;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'count_points')
  final int? countPoints;
  @override
  @JsonKey(name: 'order_status')
  final OrderStatusDTO? orderStatus;
// String? status,
  @override
  @JsonKey()
  final bool isCurrent;
  @override
  final String? address;
  @override
  final TransportDTO? transport;

  @override
  String toString() {
    return 'OrderDTO(id: $id, crossdockingId: $crossdockingId, crossdockingCityId: $crossdockingCityId, crossdockingNumber: $crossdockingNumber, crossdockName: $crossdockName, crossdockLat: $crossdockLat, crossdockLong: $crossdockLong, day: $day, description: $description, regionName: $regionName, from: $from, to: $to, fromLat: $fromLat, fromLong: $fromLong, toLat: $toLat, toLong: $toLong, status: $status, startDate: $startDate, endDate: $endDate, payment: $payment, fromCity: $fromCity, toCity: $toCity, points: $points, countPoints: $countPoints, orderStatus: $orderStatus, isCurrent: $isCurrent, address: $address, transport: $transport)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.crossdockingId, crossdockingId) &&
            const DeepCollectionEquality()
                .equals(other.crossdockingCityId, crossdockingCityId) &&
            const DeepCollectionEquality()
                .equals(other.crossdockingNumber, crossdockingNumber) &&
            const DeepCollectionEquality()
                .equals(other.crossdockName, crossdockName) &&
            const DeepCollectionEquality()
                .equals(other.crossdockLat, crossdockLat) &&
            const DeepCollectionEquality()
                .equals(other.crossdockLong, crossdockLong) &&
            const DeepCollectionEquality().equals(other.day, day) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.regionName, regionName) &&
            const DeepCollectionEquality().equals(other.from, from) &&
            const DeepCollectionEquality().equals(other.to, to) &&
            const DeepCollectionEquality().equals(other.fromLat, fromLat) &&
            const DeepCollectionEquality().equals(other.fromLong, fromLong) &&
            const DeepCollectionEquality().equals(other.toLat, toLat) &&
            const DeepCollectionEquality().equals(other.toLong, toLong) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            const DeepCollectionEquality().equals(other.endDate, endDate) &&
            const DeepCollectionEquality().equals(other.payment, payment) &&
            const DeepCollectionEquality().equals(other.fromCity, fromCity) &&
            const DeepCollectionEquality().equals(other.toCity, toCity) &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            const DeepCollectionEquality()
                .equals(other.countPoints, countPoints) &&
            const DeepCollectionEquality()
                .equals(other.orderStatus, orderStatus) &&
            const DeepCollectionEquality().equals(other.isCurrent, isCurrent) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.transport, transport));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(crossdockingId),
        const DeepCollectionEquality().hash(crossdockingCityId),
        const DeepCollectionEquality().hash(crossdockingNumber),
        const DeepCollectionEquality().hash(crossdockName),
        const DeepCollectionEquality().hash(crossdockLat),
        const DeepCollectionEquality().hash(crossdockLong),
        const DeepCollectionEquality().hash(day),
        const DeepCollectionEquality().hash(description),
        const DeepCollectionEquality().hash(regionName),
        const DeepCollectionEquality().hash(from),
        const DeepCollectionEquality().hash(to),
        const DeepCollectionEquality().hash(fromLat),
        const DeepCollectionEquality().hash(fromLong),
        const DeepCollectionEquality().hash(toLat),
        const DeepCollectionEquality().hash(toLong),
        const DeepCollectionEquality().hash(status),
        const DeepCollectionEquality().hash(startDate),
        const DeepCollectionEquality().hash(endDate),
        const DeepCollectionEquality().hash(payment),
        const DeepCollectionEquality().hash(fromCity),
        const DeepCollectionEquality().hash(toCity),
        const DeepCollectionEquality().hash(_points),
        const DeepCollectionEquality().hash(countPoints),
        const DeepCollectionEquality().hash(orderStatus),
        const DeepCollectionEquality().hash(isCurrent),
        const DeepCollectionEquality().hash(address),
        const DeepCollectionEquality().hash(transport)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_OrderDTOCopyWith<_$_OrderDTO> get copyWith =>
      __$$_OrderDTOCopyWithImpl<_$_OrderDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderDTOToJson(this);
  }
}

abstract class _OrderDTO implements OrderDTO {
  const factory _OrderDTO(
      {required final int id,
      @JsonKey(name: 'crossdocking_id') final int? crossdockingId,
      @JsonKey(name: 'crossdocking_city_id') final int? crossdockingCityId,
      @JsonKey(name: 'crossdocking_number') final int? crossdockingNumber,
      @JsonKey(name: 'crossdocking_name') final String? crossdockName,
      @JsonKey(name: 'crossdocking_lat') final String? crossdockLat,
      @JsonKey(name: 'crossdocking_long') final String? crossdockLong,
      final dynamic day,
      final String? description,
      @JsonKey(name: 'region_name') final String? regionName,
      final String? from,
      final String? to,
      @JsonKey(name: 'from_lat') final double? fromLat,
      @JsonKey(name: 'from_long') final double? fromLong,
      @JsonKey(name: 'to_lat') final double? toLat,
      @JsonKey(name: 'to_long') final double? toLong,
      final String? status,
      @JsonKey(name: 'start_date') final DateTime? startDate,
      @JsonKey(name: 'end_date') final DateTime? endDate,
      final String? payment,
      @JsonKey(name: 'from_city_id') final CityDTO? fromCity,
      @JsonKey(name: 'to_city_id') final CityDTO? toCity,
      final List<PointDTO?>? points,
      @JsonKey(name: 'count_points') final int? countPoints,
      @JsonKey(name: 'order_status') final OrderStatusDTO? orderStatus,
      final bool isCurrent,
      final String? address,
      final TransportDTO? transport}) = _$_OrderDTO;

  factory _OrderDTO.fromJson(Map<String, dynamic> json) = _$_OrderDTO.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'crossdocking_id')
  int? get crossdockingId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'crossdocking_city_id')
  int? get crossdockingCityId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'crossdocking_number')
  int? get crossdockingNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'crossdocking_name')
  String? get crossdockName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'crossdocking_lat')
  String? get crossdockLat => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'crossdocking_long')
  String? get crossdockLong => throw _privateConstructorUsedError;
  @override
  dynamic get day => throw _privateConstructorUsedError;
  @override // FIXME
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'region_name')
  String? get regionName => throw _privateConstructorUsedError;
  @override
  String? get from => throw _privateConstructorUsedError;
  @override
  String? get to => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'from_lat')
  double? get fromLat => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'from_long')
  double? get fromLong => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'to_lat')
  double? get toLat => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'to_long')
  double? get toLong => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'start_date')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'end_date')
  DateTime? get endDate => throw _privateConstructorUsedError;
  @override
  String? get payment => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'from_city_id')
  CityDTO? get fromCity => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'to_city_id')
  CityDTO? get toCity => throw _privateConstructorUsedError;
  @override
  List<PointDTO?>? get points => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'count_points')
  int? get countPoints => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'order_status')
  OrderStatusDTO? get orderStatus => throw _privateConstructorUsedError;
  @override // String? status,
  bool get isCurrent => throw _privateConstructorUsedError;
  @override
  String? get address => throw _privateConstructorUsedError;
  @override
  TransportDTO? get transport => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDTOCopyWith<_$_OrderDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderStatusDTO _$OrderStatusDTOFromJson(Map<String, dynamic> json) {
  return _OrderStatusDTO.fromJson(json);
}

/// @nodoc
mixin _$OrderStatusDTO {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  int get orderId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'stop_reason')
  String? get stopReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'stop_timer')
  DateTime? get stopTimer => throw _privateConstructorUsedError;
  String? get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_status')
  String? get orderStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderStatusDTOCopyWith<OrderStatusDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusDTOCopyWith<$Res> {
  factory $OrderStatusDTOCopyWith(
          OrderStatusDTO value, $Res Function(OrderStatusDTO) then) =
      _$OrderStatusDTOCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'order_id') int orderId,
      String? status,
      @JsonKey(name: 'stop_reason') String? stopReason,
      @JsonKey(name: 'stop_timer') DateTime? stopTimer,
      String? order,
      @JsonKey(name: 'order_status') String? orderStatus});
}

/// @nodoc
class _$OrderStatusDTOCopyWithImpl<$Res>
    implements $OrderStatusDTOCopyWith<$Res> {
  _$OrderStatusDTOCopyWithImpl(this._value, this._then);

  final OrderStatusDTO _value;
  // ignore: unused_field
  final $Res Function(OrderStatusDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? orderId = freezed,
    Object? status = freezed,
    Object? stopReason = freezed,
    Object? stopTimer = freezed,
    Object? order = freezed,
    Object? orderStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      stopReason: stopReason == freezed
          ? _value.stopReason
          : stopReason // ignore: cast_nullable_to_non_nullable
              as String?,
      stopTimer: stopTimer == freezed
          ? _value.stopTimer
          : stopTimer // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderStatusDTOCopyWith<$Res>
    implements $OrderStatusDTOCopyWith<$Res> {
  factory _$$_OrderStatusDTOCopyWith(
          _$_OrderStatusDTO value, $Res Function(_$_OrderStatusDTO) then) =
      __$$_OrderStatusDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'order_id') int orderId,
      String? status,
      @JsonKey(name: 'stop_reason') String? stopReason,
      @JsonKey(name: 'stop_timer') DateTime? stopTimer,
      String? order,
      @JsonKey(name: 'order_status') String? orderStatus});
}

/// @nodoc
class __$$_OrderStatusDTOCopyWithImpl<$Res>
    extends _$OrderStatusDTOCopyWithImpl<$Res>
    implements _$$_OrderStatusDTOCopyWith<$Res> {
  __$$_OrderStatusDTOCopyWithImpl(
      _$_OrderStatusDTO _value, $Res Function(_$_OrderStatusDTO) _then)
      : super(_value, (v) => _then(v as _$_OrderStatusDTO));

  @override
  _$_OrderStatusDTO get _value => super._value as _$_OrderStatusDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? orderId = freezed,
    Object? status = freezed,
    Object? stopReason = freezed,
    Object? stopTimer = freezed,
    Object? order = freezed,
    Object? orderStatus = freezed,
  }) {
    return _then(_$_OrderStatusDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      stopReason: stopReason == freezed
          ? _value.stopReason
          : stopReason // ignore: cast_nullable_to_non_nullable
              as String?,
      stopTimer: stopTimer == freezed
          ? _value.stopTimer
          : stopTimer // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderStatusDTO implements _OrderStatusDTO {
  const _$_OrderStatusDTO(
      {required this.id,
      @JsonKey(name: 'order_id') required this.orderId,
      this.status,
      @JsonKey(name: 'stop_reason') this.stopReason,
      @JsonKey(name: 'stop_timer') this.stopTimer,
      this.order,
      @JsonKey(name: 'order_status') this.orderStatus});

  factory _$_OrderStatusDTO.fromJson(Map<String, dynamic> json) =>
      _$$_OrderStatusDTOFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'order_id')
  final int orderId;
  @override
  final String? status;
  @override
  @JsonKey(name: 'stop_reason')
  final String? stopReason;
  @override
  @JsonKey(name: 'stop_timer')
  final DateTime? stopTimer;
  @override
  final String? order;
  @override
  @JsonKey(name: 'order_status')
  final String? orderStatus;

  @override
  String toString() {
    return 'OrderStatusDTO(id: $id, orderId: $orderId, status: $status, stopReason: $stopReason, stopTimer: $stopTimer, order: $order, orderStatus: $orderStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderStatusDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.orderId, orderId) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.stopReason, stopReason) &&
            const DeepCollectionEquality().equals(other.stopTimer, stopTimer) &&
            const DeepCollectionEquality().equals(other.order, order) &&
            const DeepCollectionEquality()
                .equals(other.orderStatus, orderStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(orderId),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(stopReason),
      const DeepCollectionEquality().hash(stopTimer),
      const DeepCollectionEquality().hash(order),
      const DeepCollectionEquality().hash(orderStatus));

  @JsonKey(ignore: true)
  @override
  _$$_OrderStatusDTOCopyWith<_$_OrderStatusDTO> get copyWith =>
      __$$_OrderStatusDTOCopyWithImpl<_$_OrderStatusDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderStatusDTOToJson(this);
  }
}

abstract class _OrderStatusDTO implements OrderStatusDTO {
  const factory _OrderStatusDTO(
          {required final int id,
          @JsonKey(name: 'order_id') required final int orderId,
          final String? status,
          @JsonKey(name: 'stop_reason') final String? stopReason,
          @JsonKey(name: 'stop_timer') final DateTime? stopTimer,
          final String? order,
          @JsonKey(name: 'order_status') final String? orderStatus}) =
      _$_OrderStatusDTO;

  factory _OrderStatusDTO.fromJson(Map<String, dynamic> json) =
      _$_OrderStatusDTO.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'order_id')
  int get orderId => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'stop_reason')
  String? get stopReason => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'stop_timer')
  DateTime? get stopTimer => throw _privateConstructorUsedError;
  @override
  String? get order => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'order_status')
  String? get orderStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OrderStatusDTOCopyWith<_$_OrderStatusDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

TransportDTO _$TransportDTOFromJson(Map<String, dynamic> json) {
  return _TransportDTO.fromJson(json);
}

/// @nodoc
mixin _$TransportDTO {
  int get id => throw _privateConstructorUsedError;
  TransportModelDTO? get model => throw _privateConstructorUsedError;
  String? get number => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransportDTOCopyWith<TransportDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransportDTOCopyWith<$Res> {
  factory $TransportDTOCopyWith(
          TransportDTO value, $Res Function(TransportDTO) then) =
      _$TransportDTOCopyWithImpl<$Res>;
  $Res call({int id, TransportModelDTO? model, String? number});

  $TransportModelDTOCopyWith<$Res>? get model;
}

/// @nodoc
class _$TransportDTOCopyWithImpl<$Res> implements $TransportDTOCopyWith<$Res> {
  _$TransportDTOCopyWithImpl(this._value, this._then);

  final TransportDTO _value;
  // ignore: unused_field
  final $Res Function(TransportDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? model = freezed,
    Object? number = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as TransportModelDTO?,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $TransportModelDTOCopyWith<$Res>? get model {
    if (_value.model == null) {
      return null;
    }

    return $TransportModelDTOCopyWith<$Res>(_value.model!, (value) {
      return _then(_value.copyWith(model: value));
    });
  }
}

/// @nodoc
abstract class _$$_TransportDTOCopyWith<$Res>
    implements $TransportDTOCopyWith<$Res> {
  factory _$$_TransportDTOCopyWith(
          _$_TransportDTO value, $Res Function(_$_TransportDTO) then) =
      __$$_TransportDTOCopyWithImpl<$Res>;
  @override
  $Res call({int id, TransportModelDTO? model, String? number});

  @override
  $TransportModelDTOCopyWith<$Res>? get model;
}

/// @nodoc
class __$$_TransportDTOCopyWithImpl<$Res>
    extends _$TransportDTOCopyWithImpl<$Res>
    implements _$$_TransportDTOCopyWith<$Res> {
  __$$_TransportDTOCopyWithImpl(
      _$_TransportDTO _value, $Res Function(_$_TransportDTO) _then)
      : super(_value, (v) => _then(v as _$_TransportDTO));

  @override
  _$_TransportDTO get _value => super._value as _$_TransportDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? model = freezed,
    Object? number = freezed,
  }) {
    return _then(_$_TransportDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as TransportModelDTO?,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransportDTO implements _TransportDTO {
  const _$_TransportDTO({required this.id, this.model, this.number});

  factory _$_TransportDTO.fromJson(Map<String, dynamic> json) =>
      _$$_TransportDTOFromJson(json);

  @override
  final int id;
  @override
  final TransportModelDTO? model;
  @override
  final String? number;

  @override
  String toString() {
    return 'TransportDTO(id: $id, model: $model, number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransportDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.model, model) &&
            const DeepCollectionEquality().equals(other.number, number));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(model),
      const DeepCollectionEquality().hash(number));

  @JsonKey(ignore: true)
  @override
  _$$_TransportDTOCopyWith<_$_TransportDTO> get copyWith =>
      __$$_TransportDTOCopyWithImpl<_$_TransportDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransportDTOToJson(this);
  }
}

abstract class _TransportDTO implements TransportDTO {
  const factory _TransportDTO(
      {required final int id,
      final TransportModelDTO? model,
      final String? number}) = _$_TransportDTO;

  factory _TransportDTO.fromJson(Map<String, dynamic> json) =
      _$_TransportDTO.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  TransportModelDTO? get model => throw _privateConstructorUsedError;
  @override
  String? get number => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TransportDTOCopyWith<_$_TransportDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

TransportModelDTO _$TransportModelDTOFromJson(Map<String, dynamic> json) {
  return _TransportModelDTO.fromJson(json);
}

/// @nodoc
mixin _$TransportModelDTO {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransportModelDTOCopyWith<TransportModelDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransportModelDTOCopyWith<$Res> {
  factory $TransportModelDTOCopyWith(
          TransportModelDTO value, $Res Function(TransportModelDTO) then) =
      _$TransportModelDTOCopyWithImpl<$Res>;
  $Res call({int id, String? name});
}

/// @nodoc
class _$TransportModelDTOCopyWithImpl<$Res>
    implements $TransportModelDTOCopyWith<$Res> {
  _$TransportModelDTOCopyWithImpl(this._value, this._then);

  final TransportModelDTO _value;
  // ignore: unused_field
  final $Res Function(TransportModelDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$$_TransportModelDTOCopyWith<$Res>
    implements $TransportModelDTOCopyWith<$Res> {
  factory _$$_TransportModelDTOCopyWith(_$_TransportModelDTO value,
          $Res Function(_$_TransportModelDTO) then) =
      __$$_TransportModelDTOCopyWithImpl<$Res>;
  @override
  $Res call({int id, String? name});
}

/// @nodoc
class __$$_TransportModelDTOCopyWithImpl<$Res>
    extends _$TransportModelDTOCopyWithImpl<$Res>
    implements _$$_TransportModelDTOCopyWith<$Res> {
  __$$_TransportModelDTOCopyWithImpl(
      _$_TransportModelDTO _value, $Res Function(_$_TransportModelDTO) _then)
      : super(_value, (v) => _then(v as _$_TransportModelDTO));

  @override
  _$_TransportModelDTO get _value => super._value as _$_TransportModelDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_TransportModelDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransportModelDTO implements _TransportModelDTO {
  const _$_TransportModelDTO({required this.id, this.name});

  factory _$_TransportModelDTO.fromJson(Map<String, dynamic> json) =>
      _$$_TransportModelDTOFromJson(json);

  @override
  final int id;
  @override
  final String? name;

  @override
  String toString() {
    return 'TransportModelDTO(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransportModelDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_TransportModelDTOCopyWith<_$_TransportModelDTO> get copyWith =>
      __$$_TransportModelDTOCopyWithImpl<_$_TransportModelDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransportModelDTOToJson(this);
  }
}

abstract class _TransportModelDTO implements TransportModelDTO {
  const factory _TransportModelDTO(
      {required final int id, final String? name}) = _$_TransportModelDTO;

  factory _TransportModelDTO.fromJson(Map<String, dynamic> json) =
      _$_TransportModelDTO.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TransportModelDTOCopyWith<_$_TransportModelDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
