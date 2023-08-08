// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationDTO _$$_NotificationDTOFromJson(Map<String, dynamic> json) =>
    _$_NotificationDTO(
      id: json['id'] as int,
      order: json['order'] == null
          ? null
          : OrderDTO.fromJson(json['order'] as Map<String, dynamic>),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$_NotificationDTOToJson(_$_NotificationDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'reason': instance.reason,
    };
