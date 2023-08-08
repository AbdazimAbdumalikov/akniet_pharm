import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:europharm_flutter/widgets/custom_calendar/scrolling_years_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FullCalendarScreen extends StatefulWidget {
  const FullCalendarScreen({Key? key}) : super(key: key);

  @override
  State<FullCalendarScreen> createState() => _FullCalendarScreenState();
}

class _FullCalendarScreenState extends State<FullCalendarScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(
            "${DateTime.now().year}",
            style: ProjectTextStyles.ui_20Medium,
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
        body: ScrollingYearsCalendar(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(DateTime.now().year, 1, 1),
          lastDate: DateTime(DateTime.now().year, 12, 31),
          currentDateColor: Colors.blue,
          highlightedDateColor: Colors.deepOrange,
          monthNames: const [
            'Январь',
            'Февраль',
            'Март',
            'Апрель',
            'Май',
            'Июнь',
            'Июль',
            'Август',
            'Сентябрь',
            'Октябрь',
            'Ноябрь',
            'Декабрь',
          ],
          onMonthTap: (int day, int month, int year) {
            Navigator.of(context).pop(DateTime(year, month, day));
          },
          monthTitleStyle: ProjectTextStyles.ui_20Large.copyWith(
            color: ColorPalette.main,
          ),
        ));
  }
}
