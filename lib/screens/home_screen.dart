import 'package:flutter/material.dart';
import 'package:islami/helper/colors/app_color.dart';
import 'package:islami/screens/tabs/Sibha_tab.dart';
import 'package:islami/screens/tabs/hadith/hadith_tab.dart';
import 'package:islami/screens/tabs/quran/pages/quran_tab.dart';
import 'package:islami/screens/tabs/radio/radio_tab.dart';
import 'package:islami/screens/tabs/time/pages/time_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/${buildBackground(currentIndex)}.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.white,
          backgroundColor: AppColor.mainColor,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: buildIcon(index: 0, name: 'Quran_ic'),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              icon: buildIcon(index: 1, name: 'Hadith_ic'),
              label: 'Hadith',
            ),
            BottomNavigationBarItem(
              icon: buildIcon(index: 2, name: 'sibha_ic'),
              label: 'Sibha',
            ),
            BottomNavigationBarItem(
              icon: buildIcon(index: 3, name: 'radio_ic'),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              icon: buildIcon(index: 4, name: 'time_ic'),
              label: 'Time',
            ),
          ],
        ),
        body: Column(
          children: [
            Image.asset('assets/images/header_onboarding.png'),
            Expanded(child: tabs[currentIndex]),
          ],
        ),
      ),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SibhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  String buildBackground(index) {
    switch (index) {
      case 0:
        {
          return 'quran_bg';
        }
      case 1:
        {
          return 'Hadith_bg';
        }
      case 2:
        {
          return 'sibha_bg';
        }

      case 3:
        {
          return 'radio_bg';
        }

      default:
        {
          return 'time_bg';
        }
    }
  }

  Widget buildIcon({required index, required name}) {
    return currentIndex == index
        ? Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(153, 32, 32, 32),
                borderRadius: BorderRadius.circular(66)),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: ImageIcon(AssetImage('assets/images/$name.png')))
        : ImageIcon(AssetImage('assets/images/$name.png'));
  }
}
