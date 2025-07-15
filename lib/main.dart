import 'package:flutter/material.dart';
import 'package:islami/helper/cache/cache.dart';
import 'package:islami/helper/colors/app_color.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/screens/onboarding_screen.dart';
import 'package:islami/screens/tabs/hadith/hadith_details.dart';
import 'package:islami/screens/tabs/quran/pages/soura_details.dart';
import 'package:islami/screens/tabs/time/pages/azkar_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cache.init();
  runApp(const Islami());
}

class Islami extends StatelessWidget {
  const Islami({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headlineSmall: TextStyle(
            color: AppColor.seconndryColor,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
          headlineLarge: TextStyle(
            color: AppColor.seconndryColor,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
          bodySmall: TextStyle(
            color: AppColor.white,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
          bodyMedium: TextStyle(
            color: AppColor.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
          titleMedium: TextStyle(
            color: AppColor.creamyColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      initialRoute: Cache.getEligibility() == true
          ? HomeScreen.routeName
          : OnBoardingScreen.routeName,
      routes: {
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SouraDetails.routeName: (context) => SouraDetails(),
        HadithDetails.routeName: (context) => HadithDetails(),
        AzkarDetails.routeName: (context) => AzkarDetails(),
      },
    );
  }
}
