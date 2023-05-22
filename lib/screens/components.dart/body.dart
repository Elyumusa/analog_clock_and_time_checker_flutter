import 'dart:math';

import 'package:analog_clock_flutter/constants.dart';
import 'package:analog_clock_flutter/models/time_data_model.dart';
import 'package:analog_clock_flutter/screens/components.dart/clock.dart';
import 'package:analog_clock_flutter/screens/components.dart/time_in_hour_and_in_minute.dart';
import 'package:analog_clock_flutter/services/api_services.dart';
import 'package:analog_clock_flutter/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'clock_painter.dart';
import 'country_card.dart';

class Body extends StatelessWidget {
  Body({super.key});
  List zones = [
    "America/New_York",
    "Europe/Moscow",
    "Asia/Singapore",
    "Asia/Riyadh",
    "Africa/Lusaka",
    "Australia/Sydney",
    "Europe/Amsterdam"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "Europe/Moscow",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TimeInHourAndMinute(),
            const Spacer(),
            const Clock(),
            const Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(zones.length, (index) {
                    return FutureBuilder(
                        future: APIservice().getTimeOfZone(zones[index]),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final returned = snapshot.data as TimeDataModel;
                            return CountryCard(
                              country: returned.timeZone.split("/").isEmpty
                                  ? returned.timeZone
                                  : returned.timeZone.split("/")[1],
                              timeZone: returned.timeZone,
                              time: returned.time,
                              period: "",
                              iconSrc: "assets/icons/Liberty.svg",
                            );
                          } else {
                            return const CountryCard(
                              country: "",
                              timeZone: "",
                              time: "",
                              period: "",
                              iconSrc: "assets/icons/Liberty.svg",
                            );
                          }
                        });
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
