import 'dart:developer';

import 'package:europharm_flutter/network/dio_wrapper/dio_extension.dart';
import 'package:europharm_flutter/network/models/dto_models/response/error.dart';
import 'package:europharm_flutter/network/models/user_dto.dart';
import 'package:europharm_flutter/network/repository/global_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'empty_drivers_cubit.freezed.dart';

const _tag = 'EmptyDriversCubit';

class EmptyDriversCubit extends Cubit<EmptyDriversState> {
  final GlobalRepository globalRepository;
  EmptyDriversCubit({
    required this.globalRepository,
  }) : super(const EmptyDriversState.initialState());

  List<UserDTO> _drivers = [];

  Future<void> getEmptyDrivers() async {
    emit(const EmptyDriversState.loadingState());

    try {
      final List<UserDTO> drivers = await globalRepository.getEmptyDrivers();
      _drivers = drivers;
      // log(drivers.toString(), name: _tag);
      emit(EmptyDriversState.loadedState(emptyDrivers: _drivers));
    } catch (e) {
      log('error $e', name: _tag);
      emit(
        EmptyDriversState.errorState(
          error: AppError(
            message: e.dioErrorMessage,
            code: e.dioErrorStatusCode,
          ),
        ),
      );
    }
  }

  Future<void> searchDrivers({
    required String searchText,
  }) async {
    emit(const EmptyDriversState.loadingState());
    List<UserDTO> tempDrivers = [];
    for (int i = 0; i < _drivers.length; i++) {
      if (_drivers[i].name == null) continue;
      if (_drivers[i].surname == null) continue;

      if (_drivers[i].name!.toLowerCase().contains(searchText.toLowerCase()) ||
          _drivers[i]
              .surname!
              .toLowerCase()
              .contains(searchText.toLowerCase())) {
        tempDrivers.add(_drivers[i]);
      }
      emit(EmptyDriversState.loadedState(emptyDrivers: tempDrivers));
    }
  }
}

@freezed
class EmptyDriversState with _$EmptyDriversState {
  const factory EmptyDriversState.initialState() = _InitialState;
  const factory EmptyDriversState.loadingState() = _LoadingState;

  const factory EmptyDriversState.loadedState(
      {required List<UserDTO> emptyDrivers}) = _LoadedState;

  const factory EmptyDriversState.errorState({
    required AppError error,
  }) = _ErrorState;
}
