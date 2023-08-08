part of './phone_bottom_dialog.dart';

void showReferalCodeBottomDialog(BuildContext context, SignUpVModel vModel) {
  showAppBottomSheet(context,
      initialChildSize: 0.45,
      useRootNavigator: true,
      child: _BuildReferalCodeField(
        vmodel: vModel,
      ));
}

class _BuildReferalCodeField extends StatefulWidget {
  final SignUpVModel vmodel;

  const _BuildReferalCodeField({Key? key, required this.vmodel}) : super(key: key);

  @override
  _BuildReferalCodeFieldState createState() => _BuildReferalCodeFieldState();
}

class _BuildReferalCodeFieldState extends State<_BuildReferalCodeField> {
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
        child: BlocConsumer<BlocAuth, StateBlocAuth>(
          listener: (context, state) async {
            if (state is StateAuthLoading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
            if (state is StateAuthError) {
              showAppDialog(
                context,
                body: state.error.message,
              );
            }
            if (state is StateSuccessSignIn) {
              context.read<LoginBloc>().add(
                    LogInEvent(
                      state.accessToken,
                    ),
                  );
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).referalCode,
                            style: ProjectTextStyles.ui_20Medium,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              successReferalCodeCallback(context);
                            },
                            child: SvgPicture.asset(
                              "assets/images/svg/referal_code_help.svg",
                              color: ColorPalette.main,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      widget.vmodel.referalCode,
                      const SizedBox(
                        height: 20,
                      ),
                      MainButton(
                          title: S.of(context).signUp,
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).pop();
                            context.read<BlocAuth>().add(EventAuthPhone(
                                  phoneNumber: _vmodel.phoneText,
                                  password: _vmodel.password.controller.text,
                                ));
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pop();
                          context.read<BlocAuth>().add(EventAuthPhone(
                                phoneNumber: _vmodel.phoneText,
                                password: _vmodel.password.controller.text,
                              ));
                        },
                        child: Text(
                          S.of(context).iDontHaveReferalCode,
                          style: ProjectTextStyles.ui_16Medium.copyWith(
                            color: ColorPalette.pickColor,
                          ),
                        ),
                      )
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

Future<void> successReferalCodeCallback(BuildContext context) async {
  await showDialog(context: context, builder: (ctx) => const OneButtonDialog());
}

class OneButtonDialog extends StatelessWidget {
  const OneButtonDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return MainDialogContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/svg/referal_code_icon.svg",
              color: ColorPalette.main,
            ),
            const SizedBox(height: 15.0),
            Flexible(
              child: Text(
                S.of(context).last_part,
                style: ProjectTextStyles.ui_20Medium,
              ),
            ),
            const SizedBox(height: 5.0),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: S.of(context).referalCode,
                    style: ProjectTextStyles.ui_16Medium.copyWith(
                      color: ColorPalette.main,
                    ),
                  ),
                  TextSpan(
                    text: S.of(context).referal_code_dialog,
                    style: ProjectTextStyles.ui_16Medium.copyWith(color: ColorPalette.darkGrey),
                  )
                ])),
            const SizedBox(height: 15.0),
            MainButton(
              borderRadius: 10.0,
              title: S.of(context).understandably,
              textColor: ColorPalette.main,
              onTap: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              // icon: "assets/images/svg/arrow_right.svg",
              color: ColorPalette.white,
              borderColor: ColorPalette.main,
            ),
          ],
        ),
      ),
    );
  }
}
