part of "../bloc_personal_data.dart";

extension Read on BlocPersonalData {
  Future<void> _read(EventInitialPersonalData event,
      Emitter<StateBlocPersonalData> emit) async {
    try {
      final cities = await repository.getCities();
      emit(StateReadDataPersonalInfo(cities: cities));
    } catch (e) {
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
