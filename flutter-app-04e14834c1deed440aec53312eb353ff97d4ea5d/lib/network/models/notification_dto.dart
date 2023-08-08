// ignore_for_file: invalid_annotation_target

import 'package:europharm_flutter/network/models/order_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

@freezed
class NotificationDTO with _$NotificationDTO {
  const factory NotificationDTO({
    required int id,
    OrderDTO? order,
    String? reason,
  }) = _NotificationDTO;

  factory NotificationDTO.fromJson(Map<String, dynamic> json) =>
      _$NotificationDTOFromJson(json);
}
