part of "../bloc_personal_data.dart";

extension Edit on BlocPersonalData {
  Future<void> _edit(
    EventEditProfile event,
    Emitter<StateBlocPersonalData> emit,
  ) async {
    try {
      await repository.editProfile(event.vModel);
      emit(StateSuccessfullyEditedProfile());
    } catch (e) {
      log('$e');
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
