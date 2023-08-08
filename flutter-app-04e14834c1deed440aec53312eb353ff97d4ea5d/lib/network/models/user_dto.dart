// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const factory UserDTO({
    required int id,
    @JsonKey(name: 'city') int? cityId,
    String? phone,
    String? name,
    String? surname,
    String? date,
    String? iin,
    String? role,
    String? type,
    dynamic avatar,
    String? status,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
}
