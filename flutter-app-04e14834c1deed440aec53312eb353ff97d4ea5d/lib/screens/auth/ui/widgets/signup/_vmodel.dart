part of './phone_bottom_dialog.dart';

class SignUpVModel extends Cubit<_StateVModel> {
  SignUpVModel({
    required this.bloc,
  }) : super(
          const _StateVModel(
            isValidated: false,
          ),
        );

  final BlocAuth bloc;
  late final phone = AppTextField(
      hintStyle: ProjectTextStyles.ui_16Medium.copyWith(
        color: ColorPalette.commonGrey,
      ),
      keyboardType: TextInputType.number,
      validator: (value) => _phoneValidator(value!, error),
      hintText: '+7',
      onChanged: updateIsValidated,
      inputFormatters: [
        CustomPhoneInputFormatter(),
      ]);

  late final password = AppTextField(
    obscureText: true,
    hintStyle: ProjectTextStyles.ui_16Medium.copyWith(
      color: ColorPalette.commonGrey,
    ),
    validator: (value) => _passwordValidator(value!, error),
    hintText: S.current.less_than_8_symbols,
    onChanged: updateIsPasswordValidated,
    isVisibleObscureButton: true,
  );

  late final repeatPassword = AppTextField(
    obscureText: true,
    hintStyle: ProjectTextStyles.ui_16Medium.copyWith(
      color: ColorPalette.commonGrey,
    ),
    validator: (value) => _passwordValidator(value!, error),
    hintText: S.current.repeat_password,
    onChanged: updateIsPasswordValidated,
    isVisibleObscureButton: true,

  );
  late final referalCode = AppTextField(
    hintStyle: ProjectTextStyles.ui_16Medium.copyWith(
      color: ColorPalette.commonGrey,
    ),
    hintText: S.current.referalCodeExample,
  );
  late final pinController = TextEditingController();

  String get phoneText => phone.controller.text.replaceAll("+", "").replaceAll("(", "").replaceAll(")", "").replaceAll(" ", "");

  @override
  Future<void> close() {
    phone.dispose();
    password.dispose();
    repeatPassword.dispose();
    referalCode.dispose();
    pinController.dispose();
    return super.close();
  }

  String get error {
    // final state = bloc.state;
    // if (state is StateAuthError) {
    //   return state.error.message;
    // }
    return '';
  }

  List<String> _phoneValidator(String value, String error) {
    List<String> output = [];
    if (error.isEmpty) {
      if (value.isEmpty) {
        output.add(S.current.fill_field);
      }
      if (value.length < 17) {
        output.add(S.current.enter_phone_correctly);
      }
      return output;
    } else {
      output.add(error);
      return output;
    }
  }

  List<String> _passwordValidator(String value, String error) {
    List<String> output = [];
    if (error.isEmpty) {
      if (value.isEmpty) {
        output.add(S.current.fill_field);
      }
      if (password.controller.text != repeatPassword.controller.text) {
        output.add(S.current.passwordNotMatching);
      }
      return output;
    } else {
      output.add(error);
      return output;
    }
  }

  void updateIsValidated(String? value) {
    phone.validated;
    print(phone.controller.text.length);
    emit(
      _StateVModel(
        isValidated: phone.controller.text.isNotEmpty &&
            phone.controller.text.length == 17,
      ),
    );
  }

  void updateIsPasswordValidated(String? value) {
    password.validated;
    repeatPassword.validated;
    emit(
      _StateVModel(
        isValidated: password.controller.text.isNotEmpty &&
            repeatPassword.controller.text.isNotEmpty &&
            password.controller.text == repeatPassword.controller.text,
      ),
    );
  }
}

class _StateVModel {
  const _StateVModel({
    required this.isValidated,
  });

  final bool isValidated;
}
