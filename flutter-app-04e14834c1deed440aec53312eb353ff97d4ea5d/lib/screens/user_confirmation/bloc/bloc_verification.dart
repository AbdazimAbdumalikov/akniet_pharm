import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:europharm_flutter/network/dio_wrapper/dio_extension.dart';

import 'package:europharm_flutter/network/models/dto_models/response/error.dart';
import 'package:europharm_flutter/network/models/dto_models/response/marks_response.dart';
import 'package:europharm_flutter/network/repository/global_repository.dart';
import 'package:europharm_flutter/screens/user_confirmation/ui/_vmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'events.dart';

part 'states.dart';

class BlocVerification
    extends Bloc<EventBlocVerification, StateBlocVerification> {
  BlocVerification({
    required this.repository,
  }) : super(StateVerificationInitial()) {
    on<EventInitialVerification>((event, emit) {
      emit(StateVerificationFirstStep());
    });
    on<EventVerificationFirstStep>((event, emit) {
      emit(StateVerificationFirstStep());
    });
    on<EventVerificationSecondStep>((event, emit) {
      emit(
        StateVerificationSecondStep(
          idImages: event.idImages,
        ),
      );
    });
    on<EventVerificationThirdStep>((event, emit) {
      emit(StateVerificationThirdStep());
    });
    on<EventVerificationFourthStep>((event, emit) async {
      try {
        emit(StateVerificationLoading());
        List<int> indexes = [];
        var response = await repository.getMarks();
        for (int i = 0; i < response.data!.length; i++) {
          for (int k = 0; k < response.data!.length && k != i; k++) {
            if (response.data![i].name == response.data![k].name) {
              // response.data!.removeAt(k);
              indexes.add(k);
            }
          }
        }
        indexes = indexes.toSet().toList();
        indexes.sort((a, b) => b.compareTo(a));
        for (var element in indexes) {
          response.data?.removeAt(element);
        }
        marks = response.data!;
        log("${marks}");
        emit(StateVerificationFourthStep(marks));
      } catch (e) {
        emit(
          StateVerificationError(
            error: AppError(
              message: e.dioErrorMessage,
              code: e.dioErrorStatusCode,
            ),
          ),
        );
      }
    });
    on<EventVerificationVerify>((event, emit) async {
      try {
        emit(StateVerificationLoading());
        if (event.vmodel.isFilled()) {
          await repository.verify(event.vmodel);
          emit(StateSuccessfulVerification());
        } else {
          throw "Заполните все поля";
        }
      } catch (e) {
        if (e is DioError) {
          emit(
            StateVerificationError(
              error: AppError(
                message: e.dioErrorMessage,
                code: e.dioErrorStatusCode,
              ),
            ),
          );
        } else {
          emit(
            StateVerificationError(
              error: AppError(
                message: e.toString(),
                code: 0,
              ),
            ),
          );
        }
        emit(StateVerificationFourthStep(marks));
      }
    });
  }

  final GlobalRepository repository;
  List<Marks> marks = [];
}
