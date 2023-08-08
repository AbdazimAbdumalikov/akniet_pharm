import 'package:europharm_flutter/generated/l10n.dart';
import 'package:europharm_flutter/main/login_bloc/login_bloc.dart';
import 'package:europharm_flutter/screens/auth/bloc/bloc_auth.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:europharm_flutter/widgets/app_bottom_sheets/app_bottom_sheet.dart';
import 'package:europharm_flutter/widgets/app_bottom_sheets/app_dialog.dart';
import 'package:europharm_flutter/widgets/app_loader_overlay.dart';
import 'package:europharm_flutter/widgets/main_button/main_button.dart';
import 'package:europharm_flutter/widgets/main_text_field/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:europharm_flutter/utils/custom_phone_input_formatter.dart';

part '_vmodel.dart';

void showSignInBottomDialog(BuildContext context) {
  showAppBottomSheet(
    context,
    initialChildSize: 0.45,
    useRootNavigator: true,
    child: const _BuildLogin(),
  );
}

class _BuildLogin extends StatefulWidget {
  const _BuildLogin({Key? key}) : super(key: key);

  @override
  _BuildLoginState createState() => _BuildLoginState();
}

class _BuildLoginState extends State<_BuildLogin> {
  late final SignInVModel _vmodel;

  @override
  void initState() {
    _vmodel = SignInVModel(
      bloc: BlocProvider.of<BlocAuth>(
        context,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInVModel>.value(
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
            return BlocBuilder<SignInVModel, _StateVModel>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: S.of(context).enter_to,
                              style: ProjectTextStyles.ui_20Medium,
                            ),
                            TextSpan(
                              text: S.of(context).satti,
                              style: ProjectTextStyles.ui_20Medium
                                  .copyWith(color: ColorPalette.main),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _vmodel.phone,
                      const SizedBox(
                        height: 10,
                      ),
                      _vmodel.password,
                      const SizedBox(
                        height: 20,
                      ),
                      MainButton(
                        buttonHeight: 54,
                        title: S.of(context).next,
                        isEnabled: state.isValidated,
                        onTap: () {
                          context.read<BlocAuth>().add(EventAuthPhone(
                              phoneNumber: _vmodel.phoneText,
                              password: _vmodel.password.controller.text));
                        },
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
