import 'package:europharm_flutter/generated/l10n.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:europharm_flutter/widgets/main_button/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(),
            Column(
              children: [
                SvgPicture.asset(
                    "assets/images/svg/user_confirmation_waiting.svg"),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  S.of(context).wait_for_account_confirmation,
                  textAlign: TextAlign.center,
                  style: ProjectTextStyles.ui_20Medium
                      .copyWith(color: ColorPalette.darkGrey),
                ),
              ],
            ),
            MainButton(
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              title: S.of(context).understandably,
            )
          ],
        ),
      ),
    );
  }
}
