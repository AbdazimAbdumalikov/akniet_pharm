import 'dart:developer';

import 'package:europharm_flutter/network/dio_wrapper/dio_extension.dart';
import 'package:europharm_flutter/network/models/dto_models/response/error.dart';
import 'package:europharm_flutter/network/models/order_dto.dart';
import 'package:europharm_flutter/network/repository/global_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_orders_cubit.freezed.dart';

const _tag = 'CalendarOrdersCubit';

class CalendarOrdersCubit extends Cubit<CalendarOrdersState> {
  final GlobalRepository globalRepository;
  CalendarOrdersCubit({
    required this.globalRepository,
  }) : super(const CalendarOrdersState.initialState());

  List<OrderDTO> _orders = [];

  Future<void> getOrdersByDate({
    required String startDate,
    required String endDate,
  }) async {
    emit(const CalendarOrdersState.loadingState());

    try {
      final List<OrderDTO> orders = await globalRepository.getOrdersByDate(
        startDate: startDate,
        endDate: endDate,
      );
      _orders = orders;
      // log(drivers.toString(), name: _tag);
      emit(CalendarOrdersState.loadedState(orders: _orders));
    } catch (e) {
      log('error $e', name: _tag);
      emit(
        CalendarOrdersState.errorState(
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
class CalendarOrdersState with _$CalendarOrdersState {
  const factory CalendarOrdersState.initialState() = _InitialState;
  const factory CalendarOrdersState.loadingState() = _LoadingState;

  const factory CalendarOrdersState.loadedState({
    required List<OrderDTO> orders,
  }) = _LoadedState;

  const factory CalendarOrdersState.errorState({
    required AppError error,
  }) = _ErrorState;
}
