import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:europharm_flutter/network/dio_wrapper/dio_extension.dart';
import 'package:europharm_flutter/network/models/dto_models/response/cities_response.dart';
import 'package:europharm_flutter/network/models/dto_models/response/error.dart';
import 'package:europharm_flutter/network/repository/global_repository.dart';
import 'package:europharm_flutter/screens/personal_data_screen/ui/widgets/_vmodel.dart';
import 'package:meta/meta.dart';

part 'events.dart';
part 'parts/_edit.dart';
part 'parts/_read.dart';
part 'states.dart';

class BlocPersonalData
    extends Bloc<EventBlocPersonalData, StateBlocPersonalData> {
  final GlobalRepository repository;

  BlocPersonalData({
    required this.repository,
  }) : super(StateLoadingPersonalData()) {
    on<EventInitialPersonalData>(_read);
    on<EventEditProfile>(_edit);
    on<EventDeleteAccount>(_deleteAccount);
  }

  Future<void> _deleteAccount(
      EventDeleteAccount event, Emitter<StateBlocPersonalData> emit) async {
    try {
      final user = await repository.getProfile();
      await repository.deleteAccount(user.id);
      emit(StateSuccessfullyAccountDeleted());
    } catch (e) {
      print(e);
      emit(
        StatePersonalDataError(
          error: AppError(
            message: e.dioErrorMessage,
            code: e.dioErrorStatusCode,
          ),
        ),
      );
    }
  }
}
