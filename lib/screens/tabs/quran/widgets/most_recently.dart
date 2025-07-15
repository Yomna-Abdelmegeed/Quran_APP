import 'package:flutter/material.dart';
import 'package:islami/helper/colors/app_color.dart';
import 'package:islami/models/surah_model.dart';

class MostRecently extends StatelessWidget {
  const MostRecently(
      {super.key, required this.index, required this.surahModel});

  final int index;

  final SurahModel surahModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          index == 0 ? EdgeInsets.only(left: 20) : EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width * 0.66,
      decoration: BoxDecoration(
          color: AppColor.mainColor, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surahModel.englishSurahName,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  surahModel.arabicSuraName,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  '${surahModel.verses} Verses',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          Expanded(
              child: index.isEven
                  ? Image.asset(
                      'assets/images/most_recently_even.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/most_recently_odd.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )),
        ],
      ),
    );
  }
}
