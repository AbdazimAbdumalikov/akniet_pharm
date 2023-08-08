import 'package:europharm_flutter/widgets/app_bottom_sheets/app_bottom_sheet.dart';
import 'package:europharm_flutter/widgets/app_calendar_new/table_calendar.dart';
import 'package:europharm_flutter/widgets/app_calendar_new/utils.dart';
import 'package:europharm_flutter/widgets/main_button/main_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const width = 300.0;

void showAppCalendarBottomSheetNew(
  BuildContext context, {
  DateTime? initialDate,
  required DateTime startDate,
  required DateTime endDate,
  required Function onChangedDates,
}) {
  showAppBottomSheet(
    context,
    title: 'Календарь',
    leading: 'assets/images/svg/close.svg',
    initialChildSize: 0.9,
    expanded: true,
    useRootNavigator: true,
    leadingOnPressed: () => Navigator.of(context, rootNavigator: true).pop(),
    child: BuildTableCalendar(
      start: startDate,
      end: startDate,
      onChangedDates: onChangedDates,
    ),
  );
}

class BuildTableCalendar extends StatefulWidget {
  final DateTime start;
  final DateTime end;
  final Function onChangedDates;

  const BuildTableCalendar({
    Key? key,
    required this.start,
    required this.end,
    required this.onChangedDates,
  }) : super(key: key);

  @override
  State<BuildTableCalendar> createState() => _BuildTableCalendarState();
}

class _BuildTableCalendarState extends State<BuildTableCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.enforced;
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    _rangeStart = widget.start;
    _rangeEnd = widget.end;
    super.initState();
  }

  String dates(DateTime? fromDate, DateTime? toDate) {
    final dayFormat = DateFormat.d();
    final monthFormat = DateFormat.LLLL();
    if (toDate == null && fromDate != null) {
      return "${dayFormat.format(fromDate)} ${monthFormat.format(fromDate).substring(0, 3)}";
    } else if (toDate != null && fromDate == null) {
      return "${dayFormat.format(toDate)} ${monthFormat.format(toDate).substring(0, 3)}";
    } else if (toDate != null && fromDate != null) {
      return "${dayFormat.format(fromDate)} ${monthFormat.format(fromDate).substring(0, 3)}"
          " - ${dayFormat.format(toDate)} ${monthFormat.format(toDate).substring(0, 3)}";
    }
    setState(() {
      _rangeStart = DateTime.now();
      _rangeEnd = DateTime.now();
    });
    return '${dayFormat.format(_rangeStart!)} ${monthFormat.format(_rangeStart!).substring(0, 3)} - '
        '${dayFormat.format(_rangeEnd!)} ${monthFormat.format(_rangeEnd!).substring(0, 3)}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
          // child: Text("dawdwa"),
          child:
              // c.TableCalendar(focusedDay: DateTime.now(), firstDay: DateTime.now().subtract(const Duration(days: 365)), lastDay: DateTime.now())
              TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.now().subtract(const Duration(days: 365)),
            lastDay: DateTime.now(),
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _rangeStart = null;
                  _rangeEnd = null;
                  _rangeSelectionMode = RangeSelectionMode.toggledOff;
                });
              }
            },
            onRangeSelected: (start, end, focusedDay) {
              setState(() {
                _selectedDay = null;
                _rangeStart = start;
                _rangeEnd = end;
                _rangeSelectionMode = RangeSelectionMode.toggledOn;
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {},
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 14.0,
                  right: 16.0,
                  bottom: 48.0,
                ),
                child: MainButton(
                  title: dates(_rangeStart, _rangeEnd),
                  onTap: () {
                    widget.onChangedDates.call(_rangeStart, _rangeEnd);
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
