import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:europharm_flutter/network/models/dto_models/response/error.dart';
import 'package:europharm_flutter/network/models/repairs.dart';
import 'package:europharm_flutter/network/repository/global_repository.dart';
import 'package:meta/meta.dart';

part 'repair_page_event.dart';
part 'repair_page_state.dart';

const _tag = 'repair_page.dart';

class RepairPageBloc extends Bloc<RepairPageEvent, RepairPageState> {
  RepairPageBloc({
    required this.repository,
  }) : super(RepairPageInitial()) {
    on<RepairPageInitialEvent>(_getRepairs);
    add(RepairPageInitialEvent());
  }

  final GlobalRepository repository;

  _getRepairs(
      RepairPageInitialEvent event, Emitter<RepairPageState> emit) async {
    try {
      emit(RepairPageIsLoadingState(repairs: []));
      List<Repairs> repairs = await repository.getRepairs();
      emit(RepairPageIsLoadedState(repairs: repairs));
    } on DioError catch (e) {
      log('$e', name: _tag);
      emit(
        RepairPageLoadingErrorState(
          error: AppError(
              message:
                  "${e.response?.data?['message']} (_getDocuments method)"),
        ),
      );
    }
  }
}
