import 'dart:async';
import 'dart:io';

import 'package:europharm_flutter/network/dio_wrapper/dio_extension.dart';
import 'package:europharm_flutter/network/models/dto_models/response/error.dart';
import 'package:europharm_flutter/network/models/dto_models/response/phone_code_register_response.dart';
import 'package:europharm_flutter/network/models/dto_models/response/phone_register_response.dart';
import 'package:europharm_flutter/network/repository/global_repository.dart';
import 'package:europharm_flutter/network/services/firebase_messaging_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'events.dart';
part 'parts/register_confirm.dart';
part 'parts/register_phone.dart';
part 'parts/register_phone_code.dart';
part 'states.dart';

class BlocAuth extends Bloc<EventBlocAuth, StateBlocAuth> {
  BlocAuth({
    required this.repository,
    required this.firebaseMessagingRepository,
  }) : super(SignInInitial()) {
    on<EventRegisterPhone>(_registerPhone);
    on<EventRegisterPhoneCode>(_registerPhoneCode);
    on<EventRegisterConfirm>(_registerConfirm);
    on<EventAuthInit>((event, emit) => emit(SignInInitial()));
    on<EventAuthPhone>((event, emit) async {
      try {
        emit(StateAuthLoading());
        final token = await repository.login(event.phoneNumber, event.password);
        emit(StateSuccessSignIn(accessToken: token.accessToken!));
      } catch (e) {
        print(e);
        emit(
          StateAuthError(
            AppError(
              message: e.dioErrorMessage,
              code: e.dioErrorStatusCode,
            ),
          ),
        );
      }
    });
  }

  final GlobalRepository repository;
  final FirebaseMessagingRepository firebaseMessagingRepository;
  String registerToken = '';
}
