part of 'bloc_verification.dart';

abstract class EventBlocVerification {
  const EventBlocVerification();
}

class EventInitialVerification extends EventBlocVerification {}
class EventSuccessfulVerification extends EventBlocVerification {}

class EventVerificationFirstStep extends EventBlocVerification {}

class EventVerificationSecondStep extends EventBlocVerification {
  final List<String>? idImages;

  EventVerificationSecondStep({
    this.idImages,
  });
}

class EventVerificationThirdStep extends EventBlocVerification {}

class EventVerificationFourthStep extends EventBlocVerification {}

class EventVerificationVerify extends EventBlocVerification {
  final PersonalInfoVModel vmodel;

  EventVerificationVerify({required this.vmodel});
}
