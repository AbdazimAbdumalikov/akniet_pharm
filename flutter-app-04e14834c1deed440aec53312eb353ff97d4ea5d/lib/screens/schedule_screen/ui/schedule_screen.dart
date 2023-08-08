import 'dart:math';

import 'package:europharm_flutter/screens/full_calendar_screen/ui/full_calendar_screen.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:europharm_flutter/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

List<Color> _colorCollection = <Color>[];
List<String> _colorNames = <String>[];

class _ScheduleScreenState extends State<ScheduleScreen> {
  CalendarController calendarController = CalendarController();
  CalendarView? calendarView;
  late DateTime selectedDate;
  late int currentDate;
  late List<String> eventNameCollection;
  late List<Meeting> appointments;
  final List<String> _calendarHeader = ['1', '2', '3', '4', '5', '6', '7'];
  final List<String> _calendarHeaderDate = ['1', '2', '3', '4', '5', '6', '7'];

  String? _headerText, _headerTextYear;
  String? date;
  double? width, cellWidth;
  Icon? icon1;
  late DataSource _events;

  @override
  void initState() {
    selectedDate = DateTime.now().subtract(const Duration(days: 88));
    currentDate = DateTime.now().weekday;
    calendarView = CalendarView.week;
    _headerText = 'header';
    appointments = getMeetingDetails();
    _events = DataSource(appointments);
    width = 0.0;
    cellWidth = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width - 20;
    cellWidth = width! / 7;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 10,
            top: 20,
            right: 10,
            bottom: 85,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: width,
                      height: 40,
                      child: Row(
                        children: [
                          Text("${_headerText!} ",
                              textAlign: TextAlign.center,
                              style: ProjectTextStyles.ui_20Large),
                          Text("$_headerTextYear",
                              textAlign: TextAlign.center,
                              style: ProjectTextStyles.ui_20Medium
                                  .copyWith(color: ColorPalette.gray)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        for (int i = 0; i < 7; i++)
                          SizedBox(
                            width: cellWidth,
                            child: Text(_calendarHeader[i],
                                textAlign: TextAlign.center,
                                style: ProjectTextStyles.ui_12Medium
                                    .copyWith(color: ColorPalette.gray)),
                          ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        for (int i = 0; i < 7; i++)
                          InkWell(
                            onTap: () {
                              calendarController.displayDate = selectedDate
                                  .add(Duration(days: -currentDate + i + 1));
                              setState(() {});
                            },
                            child: SizedBox(
                              width: cellWidth,
                              // height: 30,
                              child: Text(
                                _calendarHeaderDate[i],
                                textAlign: TextAlign.center,
                                style: ProjectTextStyles.ui_16Regular,
                              ),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        for (int i = 0; i < 7; i++)
                          if (i + 1 == currentDate)
                            SizedBox(width: cellWidth, height: 5, child: icon1)
                          else
                            SizedBox(
                                width: cellWidth,
                                height: 10,
                                child: const Text(
                                  '',
                                  textAlign: TextAlign.center,
                                )),
                      ],
                    ),
                    Expanded(
                      child: SfCalendar(
                        timeSlotViewSettings: const TimeSlotViewSettings(
                            timeFormat: 'H : mm',
                            startHour: 3,
                            timeTextStyle: TextStyle(color: Colors.black)),
                        headerHeight: 0,
                        viewHeaderHeight: 0,
                        controller: calendarController,
                        view: CalendarView.day,
                        onViewChanged: (ViewChangedDetails viewChangedDetails) {
                          SchedulerBinding.instance
                              .addPostFrameCallback((duration) {
                            setState(() {});
                          });
                          if (calendarController.view == CalendarView.week ||
                              true) {
                            _headerText = DateFormat('MMMM')
                                .format(viewChangedDetails.visibleDates[
                                    viewChangedDetails.visibleDates.length ~/
                                        2])
                                .toString();
                            _headerTextYear = DateFormat('yyyy')
                                .format(viewChangedDetails.visibleDates[
                                    viewChangedDetails.visibleDates.length ~/
                                        2])
                                .toString();

                            currentDate =
                                viewChangedDetails.visibleDates[0].weekday;

                            selectedDate = viewChangedDetails.visibleDates[0];

                            for (int i = 0; i < 7; i++) {
                              _calendarHeader[i] = DateFormat('EEE')
                                  .format(viewChangedDetails.visibleDates[0]
                                      .add(Duration(
                                          days: i -
                                              viewChangedDetails
                                                  .visibleDates[0].weekday +
                                              1)))
                                  .toString();
                            }
                            for (int i = 0; i < 7; i++) {
                              _calendarHeaderDate[i] = DateFormat('d')
                                  .format(viewChangedDetails.visibleDates[0]
                                      .add(Duration(
                                          days: i -
                                              viewChangedDetails
                                                  .visibleDates[0].weekday +
                                              1)))
                                  .toString();
                            }
                          }
                          icon1 = const Icon(
                            Icons.circle,
                            size: 5,
                            color: Colors.green,
                          );
                          SchedulerBinding.instance
                              .addPostFrameCallback((duration) {
                            setState(() {});
                          });
                        },
                        firstDayOfWeek: 1,
                        dataSource: _events,
                        // _getCalendarDataSource(),
                        headerDateFormat: "MMMM",
                        blackoutDatesTextStyle: const TextStyle(
                          color: Colors.red,
                        ),
                        appointmentTextStyle: const TextStyle(
                          color: Colors.red,
                        ),
                        monthViewSettings: const MonthViewSettings(
                          numberOfWeeksInView: 6,
                          showAgenda: true,
                        ),
                        onSelectionChanged: (details) {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 47,
            right: 10,
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorPalette.main,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child:
                    SvgPicture.asset("assets/images/svg/calendar_schedule.svg"),
              ),
              onTap: () => AppRouter.push(
                context,
                const FullCalendarScreen(),
                rootNavigator: true,
              ).then(
                (value) {
                  if (value is DateTime) {
                    SchedulerBinding.instance.addPostFrameCallback(
                      (duration) {
                        setState(() {
                          calendarController.displayDate = value;
                          calendarController.selectedDate = value;
                          calendarController.view = CalendarView.day;
                          appointments = getMeetingDetails(
                              date: calendarController.selectedDate);
                          _events = DataSource(appointments);
                        });
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  //фальшивые данные потом нужно переписать чтоб брать из апи
  List<Meeting> getMeetingDetails({DateTime? date}) {
    final List<Meeting> meetingCollection = <Meeting>[];
    eventNameCollection = <String>[];
    eventNameCollection.add('General Meeting');
    eventNameCollection.add('Plan Execution');
    eventNameCollection.add('Project Plan');
    eventNameCollection.add('Consulting');
    eventNameCollection.add('Support');
    eventNameCollection.add('Development Meeting');
    eventNameCollection.add('Scrum');
    eventNameCollection.add('Project Completion');
    eventNameCollection.add('Release updates');
    eventNameCollection.add('Performance Check');

    _colorCollection = <Color>[];
    _colorCollection.add(const Color(0xFF0F8644));
    _colorCollection.add(const Color(0xFF8B1FA9));
    _colorCollection.add(const Color(0xFFD20100));
    _colorCollection.add(const Color(0xFFFC571D));
    _colorCollection.add(const Color(0xFF85461E));
    _colorCollection.add(const Color(0xFFFF00FF));
    _colorCollection.add(const Color(0xFF3D4FB5));
    _colorCollection.add(const Color(0xFFE47C73));
    _colorCollection.add(const Color(0xFF636363));

    _colorNames = <String>[];
    _colorNames.add('Green');
    _colorNames.add('Purple');
    _colorNames.add('Red');
    _colorNames.add('Orange');
    _colorNames.add('Caramel');
    _colorNames.add('Magenta');
    _colorNames.add('Blue');
    _colorNames.add('Peach');
    _colorNames.add('Gray');

    final DateTime today = date ?? DateTime.now();
    final Random random = Random();
    for (int month = -1; month < 2; month++) {
      for (int day = -5; day < 5; day++) {
        for (int hour = 9; hour < 18; hour += 5) {
          meetingCollection.add(Meeting(
            from: today
                .add(Duration(days: (month * 30) + day))
                .add(Duration(hours: hour)),
            to: today
                .add(Duration(days: (month * 30) + day))
                .add(Duration(hours: hour + 2)),
            background: _colorCollection[random.nextInt(9)],
            startTimeZone: '',
            endTimeZone: '',
            description: '',
            isAllDay: false,
            eventName: eventNameCollection[random.nextInt(7)],
          ));
        }
      }
    }

    return meetingCollection;
  }
//фальшивые данные потом нужно переписать чтоб брать из апи здесь конец
}
//фальшивые данные потом нужно переписать чтоб брать из апи

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(const Duration(minutes: 10)),
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ));

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

//потом надо будет вычленить в отдельный файл пока пусть тут постоит
class Meeting {
  Meeting({
    required this.from,
    required this.to,
    this.background = Colors.green,
    this.isAllDay = false,
    this.eventName = '',
    this.startTimeZone = '',
    this.endTimeZone = '',
    this.description = '',
  });

  final String eventName;
  final DateTime from;
  final DateTime to;
  final Color background;
  final bool isAllDay;
  final String startTimeZone;
  final String endTimeZone;
  final String description;
}

//еще один класс который нужно вычленить
class DataSource extends CalendarDataSource {
  DataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  bool isAllDay(int index) => appointments![index].isAllDay;

  @override
  String getSubject(int index) => appointments![index].eventName;

  @override
  String getStartTimeZone(int index) => appointments![index].startTimeZone;

  @override
  String getNotes(int index) => appointments![index].description;

  @override
  String getEndTimeZone(int index) => appointments![index].endTimeZone;

  @override
  Color getColor(int index) => appointments![index].background;

  @override
  DateTime getStartTime(int index) => appointments![index].from;

  @override
  DateTime getEndTime(int index) => appointments![index].to;
}
