class TimeModel {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final String gregorianDate;
  final String hijridate;
  final String weekday;

  TimeModel({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.gregorianDate,
    required this.hijridate,
    required this.weekday,
  });

  factory TimeModel.fromJson(json) {
    return TimeModel(
        fajr: json['data']['timings']['Fajr'],
        sunrise: json['data']['timings']['Sunrise'],
        dhuhr: json['data']['timings']['Dhuhr'],
        asr: json['data']['timings']['Asr'],
        maghrib: json['data']['timings']['Maghrib'],
        isha: json['data']['timings']['Isha'],
        gregorianDate: json['data']['date']['readable'],
        hijridate: json['data']['date']['hijri']['date'],
        weekday: json['data']['date']['hijri']['weekday']['en']);
  }
}
