part of './sign_in_bottom_dialog.dart';

class SignInVModel extends Cubit<_StateVModel> {
  SignInVModel({
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
      onChanged: updateIsValidated,
      validator: (value) => _validator(value!, error),
      hintText: '+7',
      inputFormatters: [
        CustomPhoneInputFormatter(),
      ]);
  late final password = AppTextField(
    hintStyle: ProjectTextStyles.ui_16Medium.copyWith(
      color: ColorPalette.commonGrey,
    ),
    onChanged: updateIsValidated,
    validator: (value) => _validator(value!, error),
    hintText: S.current.password,
    obscureText: true,
  );

  @override
  Future<void> close() {
    phone.dispose();
    password.dispose();
    return super.close();
  }

  String get error {
    // final state = bloc.state;
    // if (state is StateAuthError) {
    //   return state.error.message;
    // }
    return '';
  }

  String get phoneText => phone.controller.text.replaceAll("+", "").replaceAll("(", "").replaceAll(")", "").replaceAll(" ", "");


  List<String> _validator(String value, String error) {
    List<String> output = [];
    if (error.isEmpty) {
      if (value.isEmpty) {
        output.add(S.current.fill_field);
      }
      return output;
    } else {
      output.add(error);
      return output;
    }
  }

  void updateIsValidated(String? value) {
    phone.validated;
    password.validated;
    // print(phone.controller.text.length);
    emit(
      _StateVModel(
        isValidated: phone.controller.text.isNotEmpty &&
            password.controller.text.isNotEmpty &&
            phone.controller.text.length >= 17,
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
