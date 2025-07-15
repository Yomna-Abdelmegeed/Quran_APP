import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:islami/helper/colors/app_color.dart';
import 'package:islami/screens/tabs/time/widgets/azkar_widget.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/times.png'),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('16 Jul,\n2024', textAlign: TextAlign.start),
                          Column(
                            children: [
                              Text(
                                'Pray Time',
                                style: TextStyle(
                                  color: Color.fromARGB(178, 32, 32, 32),
                                ),
                              ),
                              Text(
                                'Tuesday',
                                style: TextStyle(
                                  color: Color.fromARGB(229, 32, 32, 32),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '109 Muh,\n1446',
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
                            enlargeFactor: 0.3),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width:
                                    MediaQuery.of(context).size.height * 0.14,
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
                                      'ASR',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.white,
                                      ),
                                    ),
                                    Text(
                                      '04:38',
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.white,
                                      ),
                                    ),
                                    Text(
                                      'PM',
                                      style: TextStyle(
                                        fontSize: 16,
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
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pray Time',
                            style: TextStyle(
                              color: Color.fromARGB(178, 32, 32, 32),
                            ),
                          ),
                          Text(
                            ' - 2:00',
                            style: TextStyle(
                              color: Color.fromARGB(178, 32, 32, 32),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.volume_off,
                    size: 35,
                  ),
                  color: AppColor.seconndryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(' Azkar'),
          SizedBox(height: 10),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AzkarWidget(
                    option: 0,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: AzkarWidget(
                    option: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
