import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  final bool isForth;
  final Duration duration;

  const TimerPage({Key? key, required this.duration, required this.isForth})
      : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Timer? timer;

  Duration? duration;

  @override
  void initState() {
    super.initState();
    duration = widget.duration;
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    if (kDebugMode) {
      print("1");
    }
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    const addSeconds = 1;
    setState(() {
      final seconds = widget.isForth
          ? duration!.inSeconds + addSeconds
          : duration!.inSeconds - addSeconds;
      duration = Duration(seconds: seconds);
    });
  }

  TextStyle bold44 = const TextStyle(fontSize: 44, color: Colors.black);

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration!.inMinutes.remainder(60));
    final seconds = twoDigits(duration!.inSeconds.remainder(60));
    final hours = twoDigits(duration!.inHours.remainder(24));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(hours, style: bold44),
              const Text(
                "Ч",
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ":",
            style: bold44,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(minutes, style: bold44),
              const Text(
                "Мин",
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ":",
            style: bold44,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(seconds, style: bold44),
              const Text(
                "Сек",
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildTime(),
    );
  }
}
