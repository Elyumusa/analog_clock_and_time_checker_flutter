import 'dart:async';

import 'package:flutter/material.dart';

import '../../size_config.dart';

class TimeInHourAndMinute extends StatefulWidget {
  TimeOfDay? timeOfDay;
  TimeInHourAndMinute({super.key, this.timeOfDay});

  @override
  State<TimeInHourAndMinute> createState() => _TimeInHourAndMinuteState();
}

class _TimeInHourAndMinuteState extends State<TimeInHourAndMinute> {
  TimeOfDay? timeOfDay;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeOfDay = widget.timeOfDay == null
        ? TimeOfDay.now()
        : TimeOfDay(
            hour: widget.timeOfDay!.hour, minute: widget.timeOfDay!.minute);
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeOfDay!.minute != TimeOfDay.now().minute) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    String period = timeOfDay!.period == DayPeriod.am ? "AM" : "PM";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${timeOfDay!.hourOfPeriod}:${timeOfDay!.minute}",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          width: 5,
        ),
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              period,
              style: TextStyle(fontSize: getProportionateScreenWidth(18)),
            ))
      ],
    );
  }
}
