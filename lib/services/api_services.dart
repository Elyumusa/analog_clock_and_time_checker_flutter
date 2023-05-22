import 'dart:convert';

import 'package:analog_clock_flutter/models/time_data_model.dart';
import 'package:http/http.dart' as http;

class APIservice {
  Future getAllAvailableTimeZones() async {
    try {
      final response = await http.get(
          Uri.parse("https://timeapi.io/api/TimeZone/AvailableTimeZones"),
          headers: {"accept": "application/json"});
      final jsonResponse = jsonDecode(response.body);
      List<String> zonejsonResponse = [];
      if (response.statusCode == 200) {
        print("object: ${jsonResponse.runtimeType}");
        // zonejsonResponse.addAll(jsonResponse);
        return jsonResponse;
      }
    } catch (e) {
      print("error: $e");
    }
  }

  Future getTimeOfZone(String zone) async {
    try {
      final response = await http.get(
          Uri.parse("https://timeapi.io/api/Time/current/zone?timeZone=$zone"),
          headers: {"accept": "application/json"});
      final jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print("Very Good");
        return TimeDataModel.fromjson(jsonResponse);
      }
    } catch (e) {
      print("error in very good: $e");
    }
  }
}
