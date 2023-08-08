// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDTO _$$_UserDTOFromJson(Map<String, dynamic> json) => _$_UserDTO(
      id: json['id'] as int,
      cityId: json['city'] as int?,
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      date: json['date'] as String?,
      iin: json['iin'] as String?,
      role: json['role'] as String?,
      type: json['type'] as String?,
      avatar: json['avatar'],
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_UserDTOToJson(_$_UserDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city': instance.cityId,
      'phone': instance.phone,
      'name': instance.name,
      'surname': instance.surname,
      'date': instance.date,
      'iin': instance.iin,
      'role': instance.role,
      'type': instance.type,
      'avatar': instance.avatar,
      'status': instance.status,
    };
