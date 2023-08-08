import 'package:europharm_flutter/generated/l10n.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:europharm_flutter/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.background,
      appBar: CustomAppBar(title: S.of(context).faq,),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _BuildFaqField(
                iconPath: "assets/images/svg/faq_verification.svg",
                title: S.of(context).how_to_pass_verification,
              ),
              _BuildFaqField(
                iconPath: "assets/images/svg/faq_payment.svg",
                title: S.of(context).how_to_enter_payment_info,
              ),
              _BuildFaqField(
                iconPath: "assets/images/svg/faq_password.svg",
                title: S.of(context).how_to_change_password,
              ),
              _BuildFaqField(
                iconPath: "assets/images/svg/faq_verification.svg",
                title: S.of(context).how_to_pass_verification,
              ),
              _BuildFaqField(
                iconPath: "assets/images/svg/faq_payment.svg",
                title: S.of(context).how_to_enter_payment_info,
              ),
              _BuildFaqField(
                iconPath: "assets/images/svg/faq_password.svg",
                title: S.of(context).how_to_change_password,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildFaqField extends StatefulWidget {
  final String iconPath;
  final String title;

  const _BuildFaqField({
    Key? key,
    required this.iconPath,
    required this.title,
  }) : super(key: key);

  @override
  _BuildFaqFieldState createState() => _BuildFaqFieldState();
}

class _BuildFaqFieldState extends State<_BuildFaqField> {
  bool showElement = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              showElement = !showElement;
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: ColorPalette.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorPalette.lightGrey,
                      ),
                      child: SvgPicture.asset(widget.iconPath),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.title,
                      style: ProjectTextStyles.ui_16Medium,
                    ),
                  ],
                ),
                SvgPicture.asset("assets/images/svg/chevrone_down.svg")
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Visibility(
            visible: showElement,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: ColorPalette.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sapien arcu placerat donec lacus, ac dolor. "
                    "Non sed ultricies sapien, cras ipsum, cras risus eget. Et tristique tincidunt tellus quis pharetra, maecenas risus "
                    "scelerisque. Faucibus quis et bibendum eleifend vitae et nunc cras enim. Adipiscing dui sit in facilisis aliquam blandit. "
                    "Viverra sed tortor aenean ligula lorem fringilla amet quis. Morbi non purus non donec amet at. Non facilisis sed commodo venenatis.",
                    style: ProjectTextStyles.ui_12Medium,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Вам совет помог?",
                        style: ProjectTextStyles.ui_16Medium,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: ColorPalette.lightGrey,
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(
                              vertical: 11,
                              horizontal: 12,
                            ),
                            child: const Text("👍"),
                          ),
                          const Text(
                            "или",
                            style: ProjectTextStyles.ui_16Medium,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: ColorPalette.lightGrey,
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(
                              vertical: 11,
                              horizontal: 12,
                            ),
                            child: const Text("👎"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
