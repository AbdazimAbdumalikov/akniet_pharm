import 'dart:developer';
import 'dart:io';

import 'package:europharm_flutter/network/models/dto_models/response/error.dart';
import 'package:europharm_flutter/network/models/order_dto.dart';
import 'package:europharm_flutter/screens/schedule_screen/bloc/calendar_orders_cubit.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarScreen extends StatefulWidget {
  // final Function({
  //   DateTime? startTime,
  //   DateTime? endTime,
  // }) callback;
  const CalendarScreen({
    // required this.callback,
    Key? key,
  }) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime? startTime;
  DateTime? endTime;

  @override
  void initState() {
    startTime = null;
    endTime = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Выберите дату',
          style: Theme.of(context).textTheme.headline6,
        ),

        // actions: [
        //   TextButton(
        //     onPressed: () {
        //       // widget.callback(
        //       //   startTime: startTime,
        //       //   endTime: endTime,
        //       // );
        //       // Navigator.pop(context);
        //     },
        //     child: const Text(
        //       'Готово',
        //       style: TextStyle(
        //         color: ColorPalette.main,
        //         fontSize: 15,
        //       ),
        //     ),
        //   ),
        // ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: SfDateRangePicker(
                enablePastDates: false,
                headerStyle: const DateRangePickerHeaderStyle(
                  textStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                yearCellStyle: const DateRangePickerYearCellStyle(
                  textStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                monthViewSettings: const DateRangePickerMonthViewSettings(
                  viewHeaderHeight: 40,
                  viewHeaderStyle: DateRangePickerViewHeaderStyle(
                    textStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                monthCellStyle: const DateRangePickerMonthCellStyle(
                  textStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                todayHighlightColor: Colors.orange,
                
                selectionColor: Colors.orange,
                startRangeSelectionColor: ColorPalette.orange,
                endRangeSelectionColor: ColorPalette.orange,
                rangeSelectionColor: ColorPalette.orange.withOpacity(0.1),

                // backgroundColor: Colors.grey,
                view: DateRangePickerView.month,
                selectionMode: DateRangePickerSelectionMode.range,
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  if (args.value is PickerDateRange) {
                    final DateTime? rangeStartDate = args.value.startDate;
                    final DateTime? rangeEndDate = args.value.endDate;
                    setState(() {
                      startTime = rangeStartDate;
                      endTime = rangeEndDate;
                    });
                    log('${DateFormat('yyyy-MM-dd').format(rangeStartDate!)}, $rangeEndDate',
                        name: 'FilterCalendarScreen');

                    if (startTime != null && endTime != null) {
                      BlocProvider.of<CalendarOrdersCubit>(context)
                          .getOrdersByDate(
                        startDate:
                            DateFormat('yyyy-MM-dd').format(rangeStartDate),
                        endDate: DateFormat('yyyy-MM-dd').format(rangeEndDate!),
                      );
                    }
                  }
                },
              ),
            ),
            // const SizedBox(height: 10),
            Text(
              '${startTime != null ? DateFormat('yyyy-MM-dd').format(startTime!) : "__"} - ${endTime != null ? DateFormat('yyyy-MM-dd').format(endTime!) : "__"}',
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<CalendarOrdersCubit, CalendarOrdersState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loadedState: (List<OrderDTO> orders) {
                      return orders.isNotEmpty
                          ? ListView.separated(
                              padding: const EdgeInsets.all(16),
                              itemCount: orders.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 150,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Опубликовано",
                                            style: ProjectTextStyles.ui_12Medium
                                                .copyWith(
                                                    color: ColorPalette
                                                        .commonGrey),
                                          ),
                                          Text(
                                            DateFormat("dd MMMM").format(
                                                orders[index].startDate!),
                                            style: ProjectTextStyles.ui_12Medium
                                                .copyWith(
                                                    color: ColorPalette
                                                        .commonGrey),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              //widget.order.employee?.name ?? S.of(context).no_data,
                                              '0000000${orders[index].id}',

                                              style:
                                                  ProjectTextStyles.ui_20Medium,
                                            ),
                                          ),
                                          if (orders[index]
                                                      .status
                                                      ?.toLowerCase() ==
                                                  "accepted" ||
                                              orders[index]
                                                      .status
                                                      ?.toLowerCase() ==
                                                  "in_process" ||
                                              orders[index]
                                                      .status
                                                      ?.toLowerCase() ==
                                                  "stopped")
                                            Container(
                                              decoration: BoxDecoration(
                                                color: ColorPalette.grey400,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              padding: const EdgeInsets.all(4),
                                              child: Text(
                                                "Текущий Заказ",
                                                style: ProjectTextStyles
                                                    .ui_10Regular
                                                    .copyWith(
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
                                          'Откуда: ${orders[index].from}',
                                          style: ProjectTextStyles.ui_16Regular,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text('Куда: ${orders[index].to}',
                                            style:
                                                ProjectTextStyles.ui_16Regular),
                                      ),
                                      // Flexible(
                                      //   child: Text(
                                      //     'Способ оплаты: ${orders[index].payment}',
                                      //     style: ProjectTextStyles.ui_12Medium
                                      //         .copyWith(
                                      //             color: ColorPalette.darkGrey),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 10);
                              },
                            )
                          : const Center(
                              child: Text('Не найдено заказов'),
                            );
                    },
                    errorState: (AppError error) {
                      return const Center(
                        child: Text('Не найдено заказов'),
                      );
                    },
                    loadingState: () {
                      return Platform.isIOS
                          ? const Center(child: CupertinoActivityIndicator())
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                    orElse: () => const SizedBox(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
