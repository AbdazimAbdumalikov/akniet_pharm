// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationDTO _$NotificationDTOFromJson(Map<String, dynamic> json) {
  return _NotificationDTO.fromJson(json);
}

/// @nodoc
mixin _$NotificationDTO {
  int get id => throw _privateConstructorUsedError;
  OrderDTO? get order => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationDTOCopyWith<NotificationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDTOCopyWith<$Res> {
  factory $NotificationDTOCopyWith(
          NotificationDTO value, $Res Function(NotificationDTO) then) =
      _$NotificationDTOCopyWithImpl<$Res>;
  $Res call({int id, OrderDTO? order, String? reason});

  $OrderDTOCopyWith<$Res>? get order;
}

/// @nodoc
class _$NotificationDTOCopyWithImpl<$Res>
    implements $NotificationDTOCopyWith<$Res> {
  _$NotificationDTOCopyWithImpl(this._value, this._then);

  final NotificationDTO _value;
  // ignore: unused_field
  final $Res Function(NotificationDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? order = freezed,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderDTO?,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $OrderDTOCopyWith<$Res>? get order {
    if (_value.order == null) {
      return null;
    }

    return $OrderDTOCopyWith<$Res>(_value.order!, (value) {
      return _then(_value.copyWith(order: value));
    });
  }
}

/// @nodoc
abstract class _$$_NotificationDTOCopyWith<$Res>
    implements $NotificationDTOCopyWith<$Res> {
  factory _$$_NotificationDTOCopyWith(
          _$_NotificationDTO value, $Res Function(_$_NotificationDTO) then) =
      __$$_NotificationDTOCopyWithImpl<$Res>;
  @override
  $Res call({int id, OrderDTO? order, String? reason});

  @override
  $OrderDTOCopyWith<$Res>? get order;
}

/// @nodoc
class __$$_NotificationDTOCopyWithImpl<$Res>
    extends _$NotificationDTOCopyWithImpl<$Res>
    implements _$$_NotificationDTOCopyWith<$Res> {
  __$$_NotificationDTOCopyWithImpl(
      _$_NotificationDTO _value, $Res Function(_$_NotificationDTO) _then)
      : super(_value, (v) => _then(v as _$_NotificationDTO));

  @override
  _$_NotificationDTO get _value => super._value as _$_NotificationDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? order = freezed,
    Object? reason = freezed,
  }) {
    return _then(_$_NotificationDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderDTO?,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationDTO implements _NotificationDTO {
  const _$_NotificationDTO({required this.id, this.order, this.reason});

  factory _$_NotificationDTO.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationDTOFromJson(json);

  @override
  final int id;
  @override
  final OrderDTO? order;
  @override
  final String? reason;

  @override
  String toString() {
    return 'NotificationDTO(id: $id, order: $order, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.order, order) &&
            const DeepCollectionEquality().equals(other.reason, reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(order),
      const DeepCollectionEquality().hash(reason));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationDTOCopyWith<_$_NotificationDTO> get copyWith =>
      __$$_NotificationDTOCopyWithImpl<_$_NotificationDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationDTOToJson(this);
  }
}

abstract class _NotificationDTO implements NotificationDTO {
  const factory _NotificationDTO(
      {required final int id,
      final OrderDTO? order,
      final String? reason}) = _$_NotificationDTO;

  factory _NotificationDTO.fromJson(Map<String, dynamic> json) =
      _$_NotificationDTO.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  OrderDTO? get order => throw _privateConstructorUsedError;
  @override
  String? get reason => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationDTOCopyWith<_$_NotificationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
