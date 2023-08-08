import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessOrderFinished extends StatelessWidget {
  const SuccessOrderFinished({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.main,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Поздравляем! Первый\nпункт завершен!",
            textAlign: TextAlign.center,
            style: ProjectTextStyles.ui_24Medium.copyWith(
              color: Colors.white,
            ),
          ),
          Image.asset("assets/images/png/Saly-44.png"),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        "К следующему пункту",
                        style: ProjectTextStyles.ui_16Medium.copyWith(
                          color: ColorPalette.main,
                        ),
                      ),
                    ),
                    Positioned(
                        right: 15,
                        child: SvgPicture.asset(
                          "assets/images/svg/arrow_right.svg",
                          color: ColorPalette.main,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
