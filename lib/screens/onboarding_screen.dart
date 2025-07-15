import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/helper/cache/cache.dart';
import 'package:islami/helper/colors/app_color.dart';
import 'package:islami/screens/home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const String routeName = "OnBoarding";

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName) {
    return Image.asset('assets/images/$assetName');
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
      fontSize: 20,
      color: AppColor.mainColor,
      fontWeight: FontWeight.w700,
    );

    const titleStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColor.mainColor,
    );

    const containerTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColor.mainColor,
    );

    const pageDecoration = PageDecoration(
      titleTextStyle: titleStyle,
      bodyTextStyle: bodyStyle,
      bodyFlex: 2,
      imagePadding: EdgeInsets.zero,
      imageFlex: 7,
      imageAlignment: Alignment.bottomCenter,
    );

    return IntroductionScreen(
      globalBackgroundColor: AppColor.seconndryColor,
      key: introKey,
      globalHeader: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          child: _buildImage('header_onboarding.png'),
        ),
      ),
      onDone: () {
        Cache.saveEligibility();
        Navigator.pushNamed(context, HomeScreen.routeName);
      },
      showNextButton: true,
      showBackButton: true,
      showDoneButton: true,
      next: const Text('Next', style: containerTextStyle),
      back: const Text('Back', style: containerTextStyle),
      done: const Text('Finish', style: containerTextStyle),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeColor: AppColor.mainColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      pages: [
        PageViewModel(
            title: "Welcome To Islmi App",
            body: "",
            image: _buildImage('onboarding1.png'),
            decoration: pageDecoration),
        PageViewModel(
            title: "Welcome To Islmi App",
            body: "We Are Very Excited To Have You In Our Community",
            image: _buildImage('onboarding2.png'),
            decoration: pageDecoration),
        PageViewModel(
            title: "Reading the Quran",
            body: "Read, and your Lord is the Most Generous",
            image: _buildImage('onboarding3.png'),
            decoration: pageDecoration),
        PageViewModel(
            title: "Bearish",
            body: "Praise the name of your Lord, the Most High",
            image: _buildImage('onboarding4.png'),
            decoration: pageDecoration),
        PageViewModel(
          body:
              'You can listen to the Holy Quran Radio through the application for free and easily',
          title: "Holy Quran Radio",
          decoration: pageDecoration,
          image: _buildImage('onboarding5.png'),
        ),
      ],
    );
  }
}
