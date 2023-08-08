part of 'bloc_verification.dart';

abstract class StateBlocVerification {
  const StateBlocVerification();
}

class StateVerificationInitial extends StateBlocVerification {}

class StateVerificationLoading extends StateBlocVerification {}

class StateSuccessfulVerification extends StateBlocVerification {}

class StateVerificationFirstStep extends StateBlocVerification {}

class StateVerificationSecondStep extends StateBlocVerification {
  final List<String>? idImages;

  StateVerificationSecondStep({
    this.idImages,
  });
}

class StateVerificationThirdStep extends StateBlocVerification {}

class StateVerificationFourthStep extends StateBlocVerification {
  final List<Marks> marks;

  StateVerificationFourthStep(this.marks);
}

class StateVerificationError extends StateBlocVerification {
  final AppError error;

  StateVerificationError({required this.error});
}
