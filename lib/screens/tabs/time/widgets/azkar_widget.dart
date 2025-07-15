import 'package:flutter/material.dart';
import 'package:islami/helper/colors/app_color.dart';
import 'package:islami/screens/tabs/time/pages/azkar_details.dart';

class AzkarWidget extends StatelessWidget {
  AzkarWidget({super.key, required this.option});

  int option;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AzkarDetails.routeName, arguments: option);
      },
      child: Container(
        padding: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.mainColor,
            width: 1.4,
          ),
          color: AppColor.seconndryColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          children: [
            Image.asset(
                'assets/images/${option == 1 ? 'morning_azkar' : "evening_azkar"}.png'),
            Text(option == 1 ? 'Morning Azkar' : "Evening Azkar")
          ],
        ),
      ),
    );
  }
}
