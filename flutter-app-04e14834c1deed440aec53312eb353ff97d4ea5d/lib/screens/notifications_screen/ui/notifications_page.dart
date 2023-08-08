import 'dart:io';

import 'package:europharm_flutter/network/models/dto_models/response/error.dart';
import 'package:europharm_flutter/network/models/notification_dto.dart';
import 'package:europharm_flutter/screens/notifications_screen/bloc/notifications_bloc.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotificationsBloc>(context)
        .add(const NotificationsEvent.loadNotifications());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Уведомления',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/images/svg/arrow_back.svg",
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
      ),
      // backgroundColor: ColorPalette.background,
      body: SafeArea(
        child: BlocConsumer<NotificationsBloc, NotificationsState>(
          listener: (context, state) {
            state.whenOrNull(errorState: (AppError error) {});
          },
          buildWhen: (p, c) {
            return c.maybeWhen(
              loadedState: (List<NotificationDTO> notifications) => true,
              orElse: () => false,
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loadedState: (List<NotificationDTO> notifications) {
                return ListView.separated(
                  itemCount: notifications.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x1F000000),
                            offset: Offset(0, 3),
                            blurRadius: 8,
                          ),
                          BoxShadow(
                            color: Color(0x0A000000),
                            offset: Offset(0, 3),
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Опубликовано",
                                style: ProjectTextStyles.ui_12Medium
                                    .copyWith(color: ColorPalette.commonGrey),
                              ),
                              if (notifications[index].order != null)
                                Text(
                                  DateFormat("dd MMMM").format(
                                      notifications[index].order!.startDate!),
                                  style: ProjectTextStyles.ui_12Medium.copyWith(
                                    color: ColorPalette.commonGrey,
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  //widget.order.employee?.name ?? S.of(context).no_data,
                                  '0000000${notifications[index].order?.id}',

                                  style: ProjectTextStyles.ui_20Medium,
                                ),
                              ),
                              if (notifications[index]
                                          .order
                                          ?.status
                                          ?.toLowerCase() ==
                                      "accepted" ||
                                  notifications[index]
                                          .order
                                          ?.status
                                          ?.toLowerCase() ==
                                      "in_process" ||
                                  notifications[index]
                                          .order
                                          ?.status
                                          ?.toLowerCase() ==
                                      "stopped")
                                Container(
                                  decoration: BoxDecoration(
                                    color: ColorPalette.grey400,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    "Текущий Заказ",
                                    style:
                                        ProjectTextStyles.ui_10Regular.copyWith(
                                      color: ColorPalette.white,
                                    ),
                                  ),
                                )
                            ],
                          ),
                          const Divider(
                            thickness: 2,
                            color: ColorPalette.lightGrey,
                          ),
                          Flexible(
                            child: Text(
                              'Причина: ${notifications[index].reason}',
                              style: ProjectTextStyles.ui_16Medium,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 2,
                      color: ColorPalette.lightGrey,
                    );
                  },
                );
              },
              orElse: () {
                return Platform.isIOS
                    ? const Center(child: CupertinoActivityIndicator())
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
