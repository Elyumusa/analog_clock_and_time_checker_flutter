class TimeDataModel {
  final String year,
      month,
      day,
      hour,
      minute,
      seconds,
      dateTime,
      date,
      time,
      timeZone,
      dayOfWeek;
  TimeDataModel(
      {required this.year,
      required this.month,
      required this.day,
      required this.hour,
      required this.minute,
      required this.seconds,
      required this.dateTime,
      required this.date,
      required this.time,
      required this.timeZone,
      required this.dayOfWeek});
  factory TimeDataModel.fromjson(Map json) {
    return TimeDataModel(
        year: json['year'].toString(),
        month: json['month'].toString(),
        day: json['day'].toString(),
        hour: json['hour'].toString(),
        minute: json['minute'].toString(),
        seconds: json['seconds'].toString(),
        dateTime: json['dateTime'].toString(),
        date: json['date'].toString(),
        time: json['time'].toString(),
        timeZone: json['timeZone'].toString(),
        dayOfWeek: json['dayOfWeek'].toString());
  }
}
