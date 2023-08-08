import 'package:europharm_flutter/generated/l10n.dart';
import 'package:europharm_flutter/screens/ride_history_screen/bloc/bloc_ride_history.dart';
import 'package:europharm_flutter/screens/ride_history_screen/ui/widgets/calendar_bottom_dialog.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:europharm_flutter/widgets/app_list_tile.dart';
import 'package:europharm_flutter/widgets/app_loader_overlay.dart';
import 'package:europharm_flutter/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class RideHistoryScreen extends StatefulWidget {
  const RideHistoryScreen({Key? key}) : super(key: key);

  @override
  State<RideHistoryScreen> createState() => _RideHistoryScreenState();
}

class _RideHistoryScreenState extends State<RideHistoryScreen> {
  bool showDate = true;
  Map<String?,String> statuses= {
    null:"Ошибка статуса",
    "in_process":"В пути",
    "finished":"Завершен",
    "declined":"Отменен",
  };
  @override
  Widget build(BuildContext context) {
    return AppLoaderOverlay(
      child: Scaffold(
        backgroundColor: ColorPalette.background,
        appBar: CustomAppBar(
          title: S.of(context).ride_history,
        ),
        body: BlocConsumer<BlocRideHistory, StateBlocRideHistory>(
          listener: (context, state) {
            if (state is StateRideHistoryInitial) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
          },
          builder: (context, state) {
            if (state is StateLoadRideHistory) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 100),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorPalette.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showAppCalendarBottomSheetNew(
                                          context,
                                          onChangedDates:
                                              (DateTime? start, DateTime? end) {
                                            context.read<BlocRideHistory>().add(
                                                  EventReadRideHistory(
                                                    from: start,
                                                    to: end,
                                                  ),
                                                );
                                            Navigator.of(
                                              context,
                                              rootNavigator: true,
                                            ).pop();
                                          },
                                          startDate: state.from,
                                          endDate: state.to,
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: ColorPalette.main,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: SvgPicture.asset(
                                          "assets/images/svg/calendar.svg",
                                          color: ColorPalette.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "${DateFormat("dd MMMM").format(state.from)} - ${DateFormat("dd MMMM").format(state.to)}",
                                      style: ProjectTextStyles.ui_16Medium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Divider(
                              color: ColorPalette.commonBlue,
                              height: 1,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        state.history.length.toString(),
                                        style: ProjectTextStyles.ui_20Medium,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Всего",
                                        style: ProjectTextStyles.ui_16Medium
                                            .copyWith(
                                          color: ColorPalette.commonGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 50,
                                    child: VerticalDivider(
                                      color: ColorPalette.commonBlue,
                                      width: 2,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "${state.finishedLength}",
                                        style: ProjectTextStyles.ui_20Medium
                                            .copyWith(
                                          color: ColorPalette.green,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Завершен",
                                        style: ProjectTextStyles.ui_16Medium
                                            .copyWith(
                                          color: ColorPalette.commonGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 50,
                                    child: VerticalDivider(
                                      color: ColorPalette.commonBlue,
                                      width: 2,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                       Text(
                                        "${state.declinedLength}",
                                        style: ProjectTextStyles.ui_20Medium,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Отменен",
                                        style: ProjectTextStyles.ui_16Medium
                                            .copyWith(
                                          color: ColorPalette.commonGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.history.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (state.history[index].showTime)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10.0,
                                  ),
                                  child: Text(
                                    DateFormat("dd MMMM, hh:mm").format(
                                      state.history[index].createdAt!,
                                    ),
                                    style:
                                        ProjectTextStyles.ui_16Medium.copyWith(
                                      color: ColorPalette.commonGrey,
                                    ),
                                  ),
                                ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      state.history[index].showTime ? 20 : 0,
                                    ),
                                    topRight: Radius.circular(
                                      state.history[index].showTime ? 20 : 0,
                                    ),
                                    bottomLeft: Radius.circular(
                                      state.history.length == 1 ||
                                              (index !=
                                                      state.history.length -
                                                          1 &&
                                                  state.history[index + 1]
                                                      .showTime)
                                          ? 20
                                          : 0,
                                    ),
                                    bottomRight: Radius.circular(
                                      state.history.length == 1 ||
                                              (index !=
                                                      state.history.length -
                                                          1 &&
                                                  state.history[index + 1]
                                                      .showTime)
                                          ? 20
                                          : 0,
                                    ),
                                  ),
                                  color: ColorPalette.white,
                                ),
                                child: Column(
                                  children: [
                                    AppListTile(
                                      leading: const CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 10,
                                        backgroundImage: AssetImage(
                                          "assets/images/svg/history_item.svg",
                                        ),
                                      ),
                                      title: '${state.history[index].order}',

                                      /// FIXME
                                      subtitle: DateFormat("dd.MM.yyyy в kk:mm")
                                          .format(
                                        state.history[index].createdAt!,
                                      ),
                                      trailing: Text(statuses[state.history[index].orderStatus]??"Ошибка статуса"),
                                      // trailing: SvgPicture.asset(
                                      //   "assets/images/svg/chevrone_right.svg",
                                      // ),
                                      contentPadding:
                                          const EdgeInsets.all(15.0),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.history[index]
                                                      .orderTransport?.name ??
                                                  "Нет данных",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              state.history[index]
                                                      .orderTransport?.number ??
                                                  "Нет данных",
                                              style: const TextStyle(
                                                color: ColorPalette.commonGrey,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      color: ColorPalette.lightGrey,
                                      thickness: 2,
                                    ),
                                  ],
                                ),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Row(
                                //       children: [
                                //         Container(
                                //             decoration: BoxDecoration(
                                //                 borderRadius:
                                //                     BorderRadius.circular(
                                //                         100),
                                //                 color:
                                //                     ColorPalette.lightGrey),
                                //             padding: const EdgeInsets.all(8),
                                //             child: SvgPicture.asset(
                                //                 "assets/images/svg/history_item.svg")),
                                //         const SizedBox(
                                //           width: 10,
                                //         ),
                                //         Column(
                                //           crossAxisAlignment:
                                //               CrossAxisAlignment.start,
                                //           children: [
                                //             Text(
                                //               state.history[index].order!.description!,
                                //               style: ProjectTextStyles
                                //                   .ui_16Medium,
                                //               overflow: TextOverflow.ellipsis,
                                //             ),
                                //             const SizedBox(
                                //               height: 3,
                                //             ),
                                //             Text(
                                //               DateFormat("dd.MM.yyyy в kk:mm")
                                //                   .format(state
                                //                       .history[index].createdAt!),
                                //               style: ProjectTextStyles
                                //                   .ui_12Medium
                                //                   .copyWith(
                                //                       color: ColorPalette
                                //                           .commonGrey),
                                //             )
                                //           ],
                                //         ),
                                //       ],
                                //     ),
                                //     SvgPicture.asset(
                                //         "assets/images/svg/chevrone_right.svg"),
                                //   ],
                                // ),
                              ),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
