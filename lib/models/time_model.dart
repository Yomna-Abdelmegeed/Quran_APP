import 'dart:convert';

class PrayerTimes {
  final Timings timings;
  final DateInfo date;
  final Meta meta;

  PrayerTimes({
    required this.timings,
    required this.date,
    required this.meta,
  });

  factory PrayerTimes.fromJson(Map<String, dynamic> json) {
    return PrayerTimes(
      timings: Timings.fromJson(json['timings']),
      date: DateInfo.fromJson(json['date']),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class Timings {
  final String fajr,
      sunrise,
      dhuhr,
      asr,
      sunset,
      maghrib,
      isha,
      imsak,
      midnight,
      firstthird,
      lastthird;

  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstthird,
    required this.lastthird,
  });

  factory Timings.fromJson(Map<String, dynamic> json) {
    return Timings(
      fajr: json['Fajr'],
      sunrise: json['Sunrise'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      sunset: json['Sunset'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
      imsak: json['Imsak'],
      midnight: json['Midnight'],
      firstthird: json['Firstthird'],
      lastthird: json['Lastthird'],
    );
  }
}

class DateInfo {
  final String readable, timestamp;
  final Hijri hijri;
  final Gregorian gregorian;

  DateInfo({
    required this.readable,
    required this.timestamp,
    required this.hijri,
    required this.gregorian,
  });

  factory DateInfo.fromJson(Map<String, dynamic> json) {
    return DateInfo(
      readable: json['readable'],
      timestamp: json['timestamp'],
      hijri: Hijri.fromJson(json['hijri']),
      gregorian: Gregorian.fromJson(json['gregorian']),
    );
  }
}

class Hijri {
  final String date, year;
  final HijriMonth month;
  final HijriWeekday weekday;
  final List<String> holidays;

  Hijri({
    required this.date,
    required this.year,
    required this.month,
    required this.weekday,
    required this.holidays,
  });

  factory Hijri.fromJson(Map<String, dynamic> json) {
    return Hijri(
      date: json['date'],
      year: json['year'],
      month: HijriMonth.fromJson(json['month']),
      weekday: HijriWeekday.fromJson(json['weekday']),
      holidays: List<String>.from(json['holidays']),
    );
  }
}

class HijriMonth {
  final String en;
  HijriMonth({required this.en});
  factory HijriMonth.fromJson(Map<String, dynamic> json) =>
      HijriMonth(en: json['en']);
}

class HijriWeekday {
  final String en;
  HijriWeekday({required this.en});
  factory HijriWeekday.fromJson(Map<String, dynamic> json) =>
      HijriWeekday(en: json['en']);
}

class Gregorian {
  final String date, year;
  final GregorianMonth month;
  final GregorianWeekday weekday;

  Gregorian({
    required this.date,
    required this.year,
    required this.month,
    required this.weekday,
  });

  factory Gregorian.fromJson(Map<String, dynamic> json) {
    return Gregorian(
      date: json['date'],
      year: json['year'],
      month: GregorianMonth.fromJson(json['month']),
      weekday: GregorianWeekday.fromJson(json['weekday']),
    );
  }
}

class GregorianMonth {
  final String en;
  GregorianMonth({required this.en});
  factory GregorianMonth.fromJson(Map<String, dynamic> json) =>
      GregorianMonth(en: json['en']);
}

class GregorianWeekday {
  final String en;
  GregorianWeekday({required this.en});
  factory GregorianWeekday.fromJson(Map<String, dynamic> json) =>
      GregorianWeekday(en: json['en']);
}

class Meta {
  final double latitude, longitude;
  final String timezone;
  final Method method;

  Meta({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      latitude: json['latitude'],
      longitude: json['longitude'],
      timezone: json['timezone'],
      method: Method.fromJson(json['method']),
    );
  }
}

class Method {
  final String name;
  Method({required this.name});
  factory Method.fromJson(Map<String, dynamic> json) =>
      Method(name: json['name']);
}

PrayerTimes parsePrayerTimes(String jsonString) {
  final Map<String, dynamic> jsonData = json.decode(jsonString)['data'];
  return PrayerTimes.fromJson(jsonData);
}
