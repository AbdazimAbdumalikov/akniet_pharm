import 'package:cached_network_image/cached_network_image.dart';
import 'package:europharm_flutter/generated/l10n.dart';
import 'package:europharm_flutter/screens/faq_screen/ui/faq_screen.dart';
import 'package:europharm_flutter/screens/personal_data_screen/ui/personal_data_screen.dart';
import 'package:europharm_flutter/screens/profile_screen/bloc/profile_bloc.dart';
import 'package:europharm_flutter/screens/repair_history_screen/ui/repair_page.dart';
import 'package:europharm_flutter/screens/ride_history_screen/ui/ride_history_screen.dart';
import 'package:europharm_flutter/screens/settings_screen/ui/settings_screen.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:europharm_flutter/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(ProfileEventInitial());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorPalette.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                //_BuildConfirmation(), /// ПОДТВЕРДИТЕ СВОЮ ЛИЧНОСТЬ
                SizedBox(
                  height: 16,
                ),
                _BuildUserInfo(),
                SizedBox(
                  height: 16,
                ),
                _BuildProfileMenu(),
                SizedBox(
                  height: 55,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class _BuildConfirmation extends StatelessWidget {
//   const _BuildConfirmation({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: ColorPalette.commonBlue,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//                 color: ColorPalette.main,
//                 borderRadius: BorderRadius.circular(10)),
//             child: SvgPicture.asset(
//               "assets/images/svg/user_confirmation.svg",
//             ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           Text(
//             S.of(context).confirm_identity,
//             style: ProjectTextStyles.ui_20Medium,
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Text(
//             S.of(context).get_access,
//             style: ProjectTextStyles.ui_16Medium
//                 .copyWith(color: ColorPalette.darkGrey),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           GestureDetector(
//             onTap: () {
//               AppRouter.push(
//                 context,
//                 const PersonalInfoVerification(),
//                 rootNavigator: true,
//               ).then((value) {
//                 context
//                     .read<BlocVerification>()
//                     .add(EventInitialVerification());
//               });
//             },
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               decoration: BoxDecoration(
//                   color: ColorPalette.main,
//                   borderRadius: BorderRadius.circular(10)),
//               child: Stack(
//                 children: [
//                   Center(
//                     child: Text(
//                       S.of(context).do_verification,
//                       style: ProjectTextStyles.ui_16Medium.copyWith(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                       top: 3,
//                       right: 15,
//                       child:
//                           SvgPicture.asset("assets/images/svg/arrow_right.svg"))
//                 ],
//               ),
//             ),
//           ),
//           // MainButton(
//           //   onTap: () {},
//           //   title: S.of(context).do_verification,
//           // )
//         ],
//       ),
//     );
//   }
// }

class _BuildUserInfo extends StatelessWidget {
  const _BuildUserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProfileStateLoaded) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorPalette.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: state.profile.avatar != null
                      ? CachedNetworkImage(
                          width: 70,
                          height: 70,
                          imageUrl: state.profile.avatar,
                          errorWidget: (context, url, error) => const Center(
                            child: Icon(Icons.error),
                          ),
                        )
                      : Image.asset(
                          "assets/images/png/profile_photo.png",
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.profile.name != null &&
                                state.profile.surname != null
                            ? "${state.profile.name} "
                                "${state.profile.surname}"
                            : S.of(context).no_data,
                        style: ProjectTextStyles.ui_20Medium.copyWith(
                            color: ColorPalette.black,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          ...List.generate(5, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: SvgPicture.asset(
                                "assets/images/svg/${index == 4 ? "half_" : ""}filled_star.svg",
                                color: ColorPalette.main,
                              ),
                            );
                          }),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Рейтинг 4.78",
                            style: ProjectTextStyles.ui_14Medium.copyWith(
                              color: ColorPalette.commonGrey,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _BuildProfileMenu extends StatelessWidget {
  const _BuildProfileMenu({Key? key}) : super(key: key);

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
          _BuildMenuItem(
            icon: "personal_data",
            title: S.of(context).personal_data,
            onTap: () {
              final profileState = BlocProvider.of<ProfileBloc>(context).state;

              if (profileState is ProfileStateLoaded) {
                AppRouter.push(
                  context,
                  PersonalDataScreen(
                    user: profileState.profile,
                  ),
                );
              } else {
                AppRouter.push(
                  context,
                  const PersonalDataScreen(),
                );
              }
            },
          ),
          _BuildMenuItem(
            icon: "ride_history",
            title: S.of(context).ride_history,
            onTap: () {
              final bloc = BlocProvider.of<ProfileBloc>(context).state;
              if (bloc is ProfileStateLoaded) {}
              AppRouter.push(
                context,
                const RideHistoryScreen(),
              );
            },
          ),
          _BuildMenuItem(
            icon: "ride_history",
            title: "История ремонта",
            onTap: () {
              final bloc = BlocProvider.of<ProfileBloc>(context).state;
              if (bloc is ProfileStateLoaded) {}
              AppRouter.push(
                context,
                const RepairHistoryPage(),
              );
            },
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
          _BuildMenuItem(
            icon: "help",
            title: S.of(context).help,
            onTap: () {
              AppRouter.push(
                context,
                const FaqScreen(),
              );
            },
          ),
          _BuildMenuItem(
            icon: "settings",
            title: S.of(context).settings,
            onTap: () {
              AppRouter.push(
                context,
                const SettingsScreen(),
              );
            },
          ),
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
