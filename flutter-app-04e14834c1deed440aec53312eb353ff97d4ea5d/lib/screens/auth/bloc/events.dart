part of 'bloc_auth.dart';

abstract class EventBlocAuth {}

class EventAuthInit extends EventBlocAuth {}

class EventAuthLogout extends EventBlocAuth {}

class EventRegisterPhone extends EventBlocAuth {
  final String phone;

  EventRegisterPhone({
    required this.phone,
  });
}

class EventRegisterPhoneCode extends EventBlocAuth {
  final String phone;
  final String code;

  EventRegisterPhoneCode({
    required this.phone,
    required this.code,
  });
}

class EventRegisterConfirm extends EventBlocAuth {
  final String password;

  EventRegisterConfirm({
    required this.password,
  });
}

class EventAuthPhone extends EventBlocAuth {
  final String phoneNumber;
  final String password;

  EventAuthPhone({
    required this.phoneNumber,
    required this.password,
  });
}
