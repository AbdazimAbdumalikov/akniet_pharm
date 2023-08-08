part of '../profile_bloc.dart';

extension Read on ProfileBloc {
  Future<void> _read(
    ProfileEventInitial event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final UserDTO profile = await repository.getProfile();
      // String? deviceToken =
      //     await firebaseMessagingRepository.generateNewToken();
      // print(deviceToken);
      emit(ProfileStateLoaded(profile: profile));
    } catch (e) {
      emit(
        ProfileStateError(
          error: AppError(
            message: e.dioErrorMessage,
            code: e.dioErrorStatusCode,
          ),
        ),
      );
    }
  }
}
