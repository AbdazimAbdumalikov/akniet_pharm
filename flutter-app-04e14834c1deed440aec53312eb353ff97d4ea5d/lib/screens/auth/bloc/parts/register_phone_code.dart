part of '../bloc_auth.dart';

extension RegisterPhoneCode on BlocAuth {
  Future<void> _registerPhoneCode(
    EventRegisterPhoneCode event,
    Emitter<StateBlocAuth> emit,
  ) async {
    try {
      PhoneCodeRegisterResponse response =
          await repository.registerPhoneCode(event.phone, event.code);
      print(response);
      if (response.token != null) {
        registerToken = response.token ?? "";
      }
      emit(StatePhoneCodeRegisterSuccess());
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
