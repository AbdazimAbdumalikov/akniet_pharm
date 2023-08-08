import 'package:europharm_flutter/generated/l10n.dart';
import 'package:europharm_flutter/main.dart';
import 'package:europharm_flutter/main/login_bloc/login_bloc.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:europharm_flutter/widgets/custom_app_bar.dart';
import 'package:europharm_flutter/widgets/dialogs/two_buttons_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.background,
      appBar: CustomAppBar(
        title: S.of(context).settings,
      ),
      body: Stack(
        children: [
          const Positioned(
            top: 20,
            right: 10,
            left: 10,
            child: _BuildSettingsMenu(),
          ),
          Positioned(
              bottom: 105,
              right: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 15,
                ),
                decoration: BoxDecoration(
                  color: ColorPalette.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: _BuildMenuItem(
                  icon: "exit",
                  title: S.of(context).log_out,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => TwoButtonsDialog(
                        title: "Вы уверены что хотите выйти?",
                        subtitle:
                            "Если вы выйдете из аккаунта, то больше не сможете пользоваться услугами до следующего входа",
                        firstButtonText: "Да",
                        secondButtonText: "Нет",
                        onFirstTap: () {
                          Navigator.pop(ctx);
                          context.read<LoginBloc>().add(LogOutEvent());
                          RestartWidget.restartApp(context);
                        },
                        onSecondTap: () {
                          Navigator.pop(ctx);
                        },
                      ),
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }
}

class _BuildSettingsMenu extends StatelessWidget {
  const _BuildSettingsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        right: 15,
        left: 15,
      ),
      decoration: BoxDecoration(
        color: ColorPalette.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // _BuildMenuItem(
          //   icon: "personal_data",
          //   title: S.of(context).personal_data,
          //   onTap: () {
          //     AppRouter.push(
          //       context,
          //       const PersonalDataScreen(),
          //     );
          //   },
          // ),
          // _BuildMenuItem(
          //   icon: "ride_history",
          //   title: S.of(context).ride_history,
          //   onTap: () {
          //     AppRouter.push(
          //       context,
          //       const RideHistoryScreen(),
          //     );
          //   },
          // ),
          _BuildMenuItem(
            icon: "settings_finances",
            title: S.of(context).finances,
            onTap: () {},
          ),
          _BuildMenuItem(
            icon: "settings_ratings",
            title: S.of(context).ratings,
            onTap: () {},
          ),
          // _BuildMenuItem(
          //   icon: "documents",
          //   title: S.of(context).documents,
          //   onTap: () {
          //     AppRouter.push(
          //       context,
          //       const DocumentsScreen(),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}

class _BuildMenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const _BuildMenuItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorPalette.lightGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      "assets/images/svg/$icon.svg",
                      color: ColorPalette.main,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: ProjectTextStyles.ui_16Medium,
                  ),
                ],
              ),
              SvgPicture.asset(
                "assets/images/svg/chevrone_right.svg",
                width: 24,
                height: 24,
              )
            ],
          ),
        ),
      ),
    );
  }
}
