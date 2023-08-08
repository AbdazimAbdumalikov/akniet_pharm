part of '../bloc_auth.dart';

extension RegisterPhone on BlocAuth {
  Future<void> _registerPhone(
      EventRegisterPhone event, Emitter<StateBlocAuth> emit) async {
    try {
      PhoneRegisterResponse response =
          await repository.registerPhone(event.phone);
      print(response);
      emit(StatePhoneRegisterSuccess());
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
  }
}
