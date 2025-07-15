import 'package:flutter/material.dart';
import 'package:islami/helper/colors/app_color.dart';
import 'package:islami/models/surah_model.dart';
import 'package:islami/screens/tabs/quran/pages/soura_details.dart';

class SurasList extends StatelessWidget {
  const SurasList({super.key, required this.index, required this.surahModel});
  final int index;

  final SurahModel surahModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SouraDetails.routeName, arguments: index);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ImageIcon(
                AssetImage('assets/images/Sura Number.png'),
                color: AppColor.white,
                size: 52,
              ),
              Text(
                '${index + 1}',
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                surahModel.englishSurahName,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '${surahModel.verses} Verses ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          Spacer(),
          Text(
            surahModel.arabicSuraName,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
