part of '../bloc_auth.dart';

extension RegisterConfirm on BlocAuth {
  Future<void> _registerConfirm(EventRegisterConfirm event,
      Emitter<StateBlocAuth> emit) async {
    try {
      String systemName = "";
      if (Platform.isAndroid) {
        systemName = "Android";
        // var androidInfo = await DeviceInfoPlugin().androidInfo;
        // var release = androidInfo.version.release;
        // var sdkInt = androidInfo.version.sdkInt;
        // var manufacturer = androidInfo.manufacturer;
        // var model = androidInfo.model;
        // print('Android $release (SDK $sdkInt), $manufacturer $model');
        // Android 9 (SDK 28), Xiaomi Redmi Note 7
      }

      if (Platform.isIOS) {
        systemName = "iOS";
        // var iosInfo = await DeviceInfoPlugin().iosInfo;
        // var systemName = iosInfo.systemName;
        // var version = iosInfo.systemVersion;
        // var name = iosInfo.name;
        // var model = iosInfo.model;
        // print('$systemName $version, $name $model');
        // iOS 13.1, iPhone 11 Pro Max iPhone
      }
      String? deviceToken = await firebaseMessagingRepository.generateNewToken();
      PhoneCodeRegisterResponse response =
      await repository.registerConfirm(event.password, registerToken, deviceToken ?? "", systemName);
      print(response);
      emit(StateRegisterConfirmSuccess());
    } catch(e) {
      print(e);
      emit(StateAuthError(AppError(
        message: e.dioErrorMessage,
        code: e.dioErrorStatusCode,
      )));
    }
  }
}
