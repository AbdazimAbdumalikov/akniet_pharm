part of 'bloc_personal_data.dart';

@immutable
abstract class StateBlocPersonalData {}

class StateLoadingPersonalData extends StateBlocPersonalData {}

class StateReadDataPersonalInfo extends StateBlocPersonalData {
  final CitiesResponse cities;

  StateReadDataPersonalInfo({
    required this.cities,
  });
}

class StatePersonalDataError extends StateBlocPersonalData {
  final AppError error;

  StatePersonalDataError({
    required this.error,
  });
}

class StateSuccessfullyEditedProfile extends StateBlocPersonalData {}

class StateSuccessfullyAccountDeleted extends StateBlocPersonalData {}
