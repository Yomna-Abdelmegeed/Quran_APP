import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:islami/helper/colors/app_color.dart';
import 'package:islami/models/time_model.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
    required this.timeModel,
  });

  final TimeModel timeModel;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> prayers = [
      {"name": "Fajr", "time": timeModel.fajr},
      {"name": "Sunrise", "time": timeModel.sunrise},
      {"name": "Dhuhr", "time": timeModel.dhuhr},
      {"name": "Asr", "time": timeModel.asr},
      {"name": "Maghrib", "time": timeModel.maghrib},
      {"name": "Isha", "time": timeModel.isha},
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  '${timeModel.gregorianDate.split(' ')[0]} ${timeModel.gregorianDate.split(' ')[1]},\n ${timeModel.gregorianDate.split(' ')[2]}',
                  textAlign: TextAlign.start),
              Column(
                children: [
                  Text(
                    'Pray Time',
                    style: TextStyle(
                      color: Color.fromARGB(178, 32, 32, 32),
                    ),
                  ),
                  Text(
                    timeModel.weekday,
                    style: TextStyle(
                      color: Color.fromARGB(229, 32, 32, 32),
                    ),
                  ),
                ],
              ),
              Text(
                '${timeModel.hijridate.split('-')[0]}- ${timeModel.hijridate.split('-')[1]} -\n ${timeModel.hijridate.split('-')[2]}',
                textAlign: TextAlign.end,
              ),
            ],
          ),
          SizedBox(height: 32),
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.16,
              initialPage: 0,
              viewportFraction: 0.35,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
            ),
            items: prayers.map((prayer) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.height * 0.14,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 1],
                        colors: [
                          AppColor.seconndryColor,
                          AppColor.mainColor,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          prayer["name"]!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.white,
                          ),
                        ),
                        Text(
                          prayer["time"]!,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
