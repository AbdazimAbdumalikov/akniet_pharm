import 'dart:developer';

import 'package:europharm_flutter/network/dio_wrapper/dio_extension.dart';
import 'package:europharm_flutter/network/models/dto_models/response/error.dart';
import 'package:europharm_flutter/network/models/notification_dto.dart';
import 'package:europharm_flutter/network/repository/global_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_bloc.freezed.dart';

const _tag = 'NotificationsBloc';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final GlobalRepository globalRepository;
  NotificationsBloc({
    required this.globalRepository,
  }) : super(const NotificationsState.initialState()) {
    on<NotificationsEvent>(
      (NotificationsEvent event, Emitter<NotificationsState> emit) async =>
          event.map(
        loadNotifications: (value) async => _loadNotifications(value, emit),
      ),
    );
  }

  Future<void> _loadNotifications(
    _LoadNotifications event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(const NotificationsState.loadingState());

    try {
      List<NotificationDTO> notifications =
          await globalRepository.getNotifications();
      log(notifications.toString(), name: _tag);
      emit(NotificationsState.loadedState(
        notifications: notifications,
      ));
    } catch (e) {
      log('error $e', name: _tag);
      emit(
        NotificationsState.errorState(
          error: AppError(
            message: e.dioErrorMessage,
            code: e.dioErrorStatusCode,
          ),
        ),
      );
    }
  }
}

@freezed
class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.loadNotifications() = _LoadNotifications;
}

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initialState() = _InitialState;
  const factory NotificationsState.loadingState() = _LoadingState;
  const factory NotificationsState.loadedState({
    required List<NotificationDTO> notifications,
  }) = _LoadedState;
  const factory NotificationsState.errorState({
    required AppError error,
  }) = _ErrorState;
}
