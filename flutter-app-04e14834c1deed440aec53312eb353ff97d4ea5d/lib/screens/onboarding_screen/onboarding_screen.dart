import 'dart:developer';

import 'package:europharm_flutter/generated/l10n.dart';
import 'package:europharm_flutter/screens/auth/ui/widgets/sign_in/sign_in_bottom_dialog.dart';
import 'package:europharm_flutter/screens/auth/ui/widgets/signup/phone_bottom_dialog.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:europharm_flutter/widgets/main_button/main_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///OnBoardingScreen with promotion texts
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Padding(
          padding: const EdgeInsets.only(
            // top: 70,
            right: 10,
            left: 10,
          ),
          child: MediaQuery.of(context).size.height < 750
              ? SingleChildScrollView(child: _buildColumn(context))
              : _buildColumn(context),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildColumn(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            SvgPicture.asset(
              "assets/images/svg/logo.svg",
              height: 40,
            ),
            Image.asset(
              "assets/images/png/truck.png",
            ),
            Text(
              S.of(context).with_your_help_were_doing_logistics_better,
              style: ProjectTextStyles.ui_24Medium.copyWith(
                color: ColorPalette.main,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                MainButton(
                  color: ColorPalette.main,
                  borderRadius: 10.0,
                  title: S.of(context).registration,
                  onTap: () {
                    showPhoneBottomDialog(context);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                MainButton(
                  borderRadius: 10.0,
                  title: S.of(context).enter,
                  textColor: ColorPalette.main,
                  onTap: () {
                    // AppRouter.pushOff(
                    //   context,
                    //   const BottomNavigationBarScreen(),
                    // );
                    // showReferalCodeBottomDialog(
                    //     context, SignUpVModel(bloc: BlocAuth()));
                    showSignInBottomDialog(context);
                  },
                  color: ColorPalette.white,
                  borderColor: ColorPalette.main,
                ),
              ],
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
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
