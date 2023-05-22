import 'package:analog_clock_flutter/models/time_data_model.dart';
import 'package:analog_clock_flutter/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'components.dart/clock.dart';
import 'components.dart/time_in_hour_and_in_minute.dart';

class TimePage extends StatelessWidget {
  String timeZone;
  TimePage({super.key, required this.timeZone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: APIservice().getTimeOfZone(timeZone),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              TimeDataModel timeDataModel = snapshot.data;
              return SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      timeDataModel.timeZone,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TimeInHourAndMinute(
                      timeOfDay: TimeOfDay(
                          hour: int.parse(timeDataModel.hour),
                          minute: int.parse(timeDataModel.minute)),
                    ),
                    const Spacer(),
                    const Clock(),
                    const Spacer()
                  ],
                ),
              );
            } else {
              return Column();
            }
          }),
    );
  }
}
