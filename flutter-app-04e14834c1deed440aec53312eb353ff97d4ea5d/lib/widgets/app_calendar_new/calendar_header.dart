// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:europharm_flutter/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'styles.dart';
import 'utils.dart';

class CalendarHeader extends StatelessWidget {
  final dynamic locale;
  final DateTime focusedMonth;
  final CalendarFormat calendarFormat;
  final HeaderStyle headerStyle;
  final VoidCallback onLeftChevronTap;
  final VoidCallback onRightChevronTap;
  final VoidCallback onHeaderTap;
  final VoidCallback onHeaderLongPress;
  final ValueChanged<CalendarFormat> onFormatButtonTap;
  final Map<CalendarFormat, String> availableCalendarFormats;
  final DayBuilder? headerTitleBuilder;

  const CalendarHeader({
    Key? key,
    this.locale,
    required this.focusedMonth,
    required this.calendarFormat,
    required this.headerStyle,
    required this.onLeftChevronTap,
    required this.onRightChevronTap,
    required this.onHeaderTap,
    required this.onHeaderLongPress,
    required this.onFormatButtonTap,
    required this.availableCalendarFormats,
    this.headerTitleBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = headerStyle.titleTextFormatter?.call(focusedMonth, locale) ??
        DateFormat.MMMM(locale).format(focusedMonth);

    return Container(
      decoration: headerStyle.decoration,
      margin: headerStyle.headerMargin,
      padding: headerStyle.headerPadding,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text.toCapitalized,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF8897A5),
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 0.5,
            height: 24,
          ),
          // Expanded(
          //   child: headerTitleBuilder?.call(context, focusedMonth) ??
          //       GestureDetector(
          //         onTap: onHeaderTap,
          //         onLongPress: onHeaderLongPress,
          //         child: Center(
          //           child: Text(
          //             text,
          //             style: headerStyle.titleTextStyle,
          //             textAlign: headerStyle.titleCentered
          //                 ? TextAlign.center
          //                 : TextAlign.start,
          //           ),
          //         ),
          //       ),
          // ),
        ],
      ),
    );
  }
}
