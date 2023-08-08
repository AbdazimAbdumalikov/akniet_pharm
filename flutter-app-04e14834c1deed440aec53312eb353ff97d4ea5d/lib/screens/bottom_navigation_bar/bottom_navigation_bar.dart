import 'package:europharm_flutter/generated/l10n.dart';
import 'package:europharm_flutter/main/push_notifications_bloc/push_notifications_bloc.dart';
import 'package:europharm_flutter/network/repository/global_repository.dart';
import 'package:europharm_flutter/network/repository/hive_repository.dart';
import 'package:europharm_flutter/screens/bottom_navigation_bar/cubit/bottom_nav_bar_cubit.dart';
import 'package:europharm_flutter/screens/bottom_navigation_bar/custom_animated_bottom_bar.dart';
import 'package:europharm_flutter/screens/orders_screen/ui/orders_screen.dart';
import 'package:europharm_flutter/screens/profile_screen/ui/profile_screen.dart';
import 'package:europharm_flutter/screens/schedule_screen/ui/calendar_screen.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  final List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PushNotificationsBloc(
        context.read<GlobalRepository>(),
        context.read<HiveRepository>(),
      )..add(InitialPushNotifyEvent()),
      child: BlocListener<PushNotificationsBloc, PushNotificationsState>(
        listener: (context, state) {
          // if (state is NavigateToScreenState) {
          //   final notification = state.notification;
          //   if (notification is NewNoteNotify) {
          //     Navigator.of(context, rootNavigator: true).push(
          //       routeSessionReport(notification.sessionId),
          //     );
          //   }
          //   if (notification is NewMessageNotify) {
          //     Navigator.of(context, rootNavigator: true).push(
          //       routeNurseChat(
          //         chatId: notification.message.chatId,
          //         sessionId: notification.sessionId,
          //       ),
          //     );
          //   }
          //   if (notification is NewNewsNotify) {
          //     Navigator.of(context, rootNavigator: true)
          //         .push(routeNewsDetails(news: notification));
          //   }
          // }
        },
        child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
          builder: (context, state) {
            if (state is BottomNavBarInitial) {
              return WillPopScope(
                onWillPop: () async {
                  bool isPop = true;
                  isPop = await navigatorKeys[state.currentPageIndex]
                          .currentState
                          ?.maybePop() ??
                      false;
                  return !isPop;
                },
                child: Scaffold(
                  body: Stack(
                    children: [
                      IndexedStack(
                        index: state.currentPageIndex,
                        children: [
                          Navigator(
                            key: navigatorKeys[0],
                            onGenerateRoute: (route) => MaterialPageRoute(
                              builder: (context) => const OrdersScreen(),
                            ),
                          ),
                          Navigator(
                            key: navigatorKeys[1],
                            onGenerateRoute: (route) => MaterialPageRoute(
                              builder: (context) =>
                                  const CalendarScreen(), // const ScheduleScreen(),
                            ),
                          ),
                          Navigator(
                            key: navigatorKeys[2],
                            onGenerateRoute: (route) => MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 57,
                        right: 57,
                        bottom: 22,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(16, 51, 115, 0.2),
                                blurRadius: 30,
                              )
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CustomAnimatedBottomBar(
                              containerHeight: 60,
                              backgroundColor: Colors.white,
                              selectedIndex: state.currentPageIndex,
                              itemCornerRadius: 24,
                              curve: Curves.easeIn,
                              onItemSelected: (index) {
                                if (index == state.currentPageIndex) {
                                  navigatorKeys[index]
                                      .currentState!
                                      .popUntil((route) => route.isFirst);
                                } else {
                                  context
                                      .read<BottomNavBarCubit>()
                                      .changeCurrentPage(index);
                                }
                              },
                              items: [
                                BottomNavBarItem(
                                  icon: "assets/images/svg/orders.svg",
                                  title: S.of(context).orders,
                                  activeColor: ColorPalette.black,
                                  inactiveColor: ColorPalette.grey400,
                                  textAlign: TextAlign.center,
                                ),
                                BottomNavBarItem(
                                  icon: "assets/images/svg/schedule.svg",
                                  title: S.of(context).schedule,
                                  activeColor: ColorPalette.black,
                                  inactiveColor: ColorPalette.grey400,
                                  textAlign: TextAlign.center,
                                ),
                                BottomNavBarItem(
                                  icon: "assets/images/svg/user.svg",
                                  title: S.of(context).user,
                                  activeColor: ColorPalette.black,
                                  inactiveColor: ColorPalette.grey400,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
