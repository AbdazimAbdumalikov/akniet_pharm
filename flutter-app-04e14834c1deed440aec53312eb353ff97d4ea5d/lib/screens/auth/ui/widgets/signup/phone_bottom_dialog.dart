import 'dart:developer';

import 'package:europharm_flutter/generated/l10n.dart';
import 'package:europharm_flutter/main/login_bloc/login_bloc.dart';
import 'package:europharm_flutter/screens/auth/bloc/bloc_auth.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:europharm_flutter/utils/custom_phone_input_formatter.dart';
import 'package:europharm_flutter/widgets/app_bottom_sheets/app_bottom_sheet.dart';
import 'package:europharm_flutter/widgets/app_bottom_sheets/app_dialog.dart';
import 'package:europharm_flutter/widgets/app_loader_overlay.dart';
import 'package:europharm_flutter/widgets/dialogs/main_dialog_container.dart';
import 'package:europharm_flutter/widgets/main_button/main_button.dart';
import 'package:europharm_flutter/widgets/main_text_field/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

part '_vmodel.dart';

part 'sms_code_bottom_dialog.dart';

part 'create_password_bottom_dialog.dart';

part 'referal_code_bottom_dialog.dart';

void showPhoneBottomDialog(BuildContext context) {
  showAppBottomSheet(context,
      initialChildSize: 0.45,
      useRootNavigator: true,
      child: const _BuildPhoneField());
}

class _BuildPhoneField extends StatefulWidget {
  const _BuildPhoneField({Key? key}) : super(key: key);

  @override
  _BuildPhoneFieldState createState() => _BuildPhoneFieldState();
}

class _BuildPhoneFieldState extends State<_BuildPhoneField> {
  late final SignUpVModel _vmodel;

  @override
  void initState() {
    _vmodel = SignUpVModel(
      bloc: BlocProvider.of<BlocAuth>(
        context,
      ),
    );
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
            if (state is StatePhoneRegisterSuccess) {
              Navigator.of(context).pop();
              showCodeBottomDialog(context, _vmodel);
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
                        S.of(context).enter_phone_number,
                        style: ProjectTextStyles.ui_20Medium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(children: [
                          Expanded(child: _vmodel.phone),
                          const SizedBox(
                            width: 9,
                          ),
                          MainButton(
                            buttonHeight: 55,
                            width: 55,
                            icon: "assets/images/svg/arrow-right.svg",
                            onTap: () {
                              if (_vmodel.phone.validated) {
                                context.read<BlocAuth>().add(EventRegisterPhone(
                                    phone: _vmodel.phoneText));
                              }
                            },
                          )
                        ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 43,
                        ),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: ProjectTextStyles.ui_12Medium.copyWith(
                              color: ColorPalette.commonGrey,
                            ),
                            children: [
                              TextSpan(text: S.of(context).policy_title),
                              TextSpan(
                                  text: S.of(context).privacy_policy,
                                  style: ProjectTextStyles.ui_12Medium.copyWith(
                                    color: ColorPalette.pickColor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      log('privacy_policy');
                                    }),
                              const TextSpan(text: ' & '),
                              TextSpan(
                                  text: S.of(context).terms_of_use,
                                  style: ProjectTextStyles.ui_12Medium.copyWith(
                                    color: ColorPalette.pickColor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      log('terms_of_use');
                                    }),
                            ],
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
