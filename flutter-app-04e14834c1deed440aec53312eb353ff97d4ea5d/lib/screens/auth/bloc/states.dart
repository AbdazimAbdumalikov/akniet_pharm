part of 'bloc_auth.dart';

abstract class StateBlocAuth {}

class SignInInitial extends StateBlocAuth {}

class StateAuthLoading extends StateBlocAuth {}

class StatePhoneRegisterSuccess extends StateBlocAuth {}

class StatePhoneCodeRegisterSuccess extends StateBlocAuth {}

class StateRegisterConfirmSuccess extends StateBlocAuth {}

class StateSuccessSignIn extends StateBlocAuth {
  final String accessToken;

  StateSuccessSignIn({
    required this.accessToken,
  });
}

class StateAuthError extends StateBlocAuth {
  StateAuthError(this.error);

  final AppError error;

  @override
  String toString() => 'StateAuthError(error: $error)';
}
