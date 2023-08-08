part of './phone_bottom_dialog.dart';

void showCodeBottomDialog(BuildContext context, SignUpVModel vModel) {
  showAppBottomSheet(context,
      initialChildSize: 0.45,
      useRootNavigator: true,
      child: _BuildSmsCodeField(
        vmodel: vModel,
      ));
}

class _BuildSmsCodeField extends StatefulWidget {
  final SignUpVModel vmodel;

  const _BuildSmsCodeField({Key? key, required this.vmodel}) : super(key: key);

  @override
  _BuildSmsCodeFieldState createState() => _BuildSmsCodeFieldState();
}

class _BuildSmsCodeFieldState extends State<_BuildSmsCodeField> {
  late final SignUpVModel _vmodel;

  @override
  void initState() {
    _vmodel = widget.vmodel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpVModel>.value(
      value: _vmodel,
      child: AppLoaderOverlay(
        // child: SizedBox(),
        child: BlocConsumer<BlocAuth, StateBlocAuth>(
          listener: (context, state) async {
            if (state is StateAuthLoading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
            if (state is StatePhoneCodeRegisterSuccess) {
              Navigator.of(context, rootNavigator: true).pop();
              showCreatePasswordBottomDialog(context, widget.vmodel);
            }
            if (state is StateAuthError) {
              showAppDialog(context,
                  body: state.error.message,
                  onTap: () => context.read<BlocAuth>().add(EventAuthInit()));
            }
          },
          builder: (context, state) {
            return BlocBuilder<SignUpVModel, _StateVModel>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).enter_sms_code,
                        style: ProjectTextStyles.ui_20Medium,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        S
                            .of(context)
                            .code_send_to(widget.vmodel.phone.controller.text),
                        style: ProjectTextStyles.ui_12Medium.copyWith(
                          color: ColorPalette.darkGrey,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: PinCodeTextField(
                          controller: _vmodel.pinController,
                          length: 5,
                          obscureText: false,
                          cursorColor: ColorPalette.main,
                          cursorHeight: 18,
                          cursorWidth: 2,
                          textStyle: ProjectTextStyles.ui_16Medium,
                          animationType: AnimationType.fade,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10),
                            fieldHeight: 50,
                            fieldWidth: 50,
                            activeColor: ColorPalette.lightGrey,
                            activeFillColor: ColorPalette.lightGrey,
                            disabledColor: ColorPalette.lightGrey,
                            errorBorderColor: ColorPalette.errorRed,
                            inactiveColor: ColorPalette.lightGrey,
                            inactiveFillColor: ColorPalette.lightGrey,
                            selectedColor: ColorPalette.lightGrey,
                            selectedFillColor: ColorPalette.lightGrey,
                          ),
                          onChanged: (value) {
                            if (value.length == 5) {
                              context.read<BlocAuth>().add(
                                  EventRegisterPhoneCode(
                                      phone: _vmodel.phoneText,
                                      code: _vmodel.pinController.text));
                            }
                          },
                          appContext: context,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        S.of(context).code_can_be_resend(25),
                        style: ProjectTextStyles.ui_12Medium.copyWith(
                          color: ColorPalette.commonGrey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
