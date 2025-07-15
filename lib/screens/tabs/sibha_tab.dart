import 'package:flutter/material.dart';
import 'package:islami/helper/colors/app_color.dart';

class SibhaTab extends StatefulWidget {
  SibhaTab({super.key});

  @override
  State<SibhaTab> createState() => _SibhaTabState();
}

class _SibhaTabState extends State<SibhaTab> {
  int switchTo = 0;

  int counter = 0;

  List<String> praiseAllah = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
    'لا حول ولا قوة إلا بالله'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Center(
            child: Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
              style: TextStyle(
                  color: AppColor.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: GestureDetector(
            onTap: () {
              if (counter == 30) {
                counter = 0;
                switchTo = (switchTo + 1) % 5;
                setState(() {});
                return;
              }
              counter++;
              setState(() {});
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/Sebha$counter.png'),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        praiseAllah[switchTo],
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '$counter',
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
