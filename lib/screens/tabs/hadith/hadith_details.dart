import 'package:flutter/material.dart';
import 'package:islami/helper/colors/app_color.dart';
import 'package:islami/models/hadith_model.dart';

class HadithDetails extends StatelessWidget {
  const HadithDetails({super.key});

  static const String routeName = "HadithDetails";

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as HadithModel;
    return Scaffold(
      backgroundColor: AppColor.seconndryColor,
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: Text(
          'Hadith ${model.index}',
          style: TextStyle(color: AppColor.mainColor),
        ),
        iconTheme: IconThemeData(color: AppColor.mainColor),
        backgroundColor: AppColor.seconndryColor,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/soura_details.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                model.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColor.mainColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Expanded(
                child: SingleChildScrollView(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        model.content.join('\n'),
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColor.mainColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
