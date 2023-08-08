part of 'bloc_personal_data.dart';

@immutable
abstract class EventBlocPersonalData {}

class EventInitialPersonalData extends EventBlocPersonalData {}

class EventEditProfile extends EventBlocPersonalData {
  final PersonalDataVModel vModel;

  EventEditProfile({
    required this.vModel,
  });
}

class EventDeleteAccount extends EventBlocPersonalData {}
