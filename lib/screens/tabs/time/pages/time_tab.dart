import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:islami/helper/colors/app_color.dart';
import 'package:islami/models/time_model.dart';
import 'package:islami/screens/tabs/time/widgets/azkar_widget.dart';
import 'package:islami/screens/tabs/time/widgets/time_widget.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = "${now.day}-${now.month}-${now.year}";
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.33,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/times.png'),
              ),
            ),
            child: FutureBuilder(
                future: Dio().get(
                  "https://api.aladhan.com/v1/timingsByCity/$formattedDate",
                  queryParameters: {
                    "city": "Cairo",
                    "country": "Egypt",
                  },
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: AppColor.seconndryColor,
                    ));
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (snapshot.hasData) {
                    var response = snapshot.data as Response;
                    TimeModel timeModel = TimeModel.fromJson(response.data);
                    return TimeWidget(timeModel: timeModel);
                  } else {
                    return const Text('No Data Found');
                  }
                }),
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
