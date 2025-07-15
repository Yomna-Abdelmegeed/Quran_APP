import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/helper/colors/app_color.dart';
import 'package:islami/models/surah_model.dart';
import 'package:islami/screens/tabs/quran/widgets/verse_widget.dart';

class SouraDetails extends StatefulWidget {
  const SouraDetails({super.key});
  static const String routeName = "SouraDetails";

  @override
  State<SouraDetails> createState() => _SouraDetailsState();
}

class _SouraDetailsState extends State<SouraDetails> {
  List<String> verses = [];
  List<bool> isRead = [];

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    SurahModel surahModel = SurahModel.getsurah(index: index);

    if (verses.isEmpty) {
      loadSuraFile(index + 1);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.seconndryColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColor.mainColor),
        title: Text(
          surahModel.englishSurahName,
          style: TextStyle(color: AppColor.mainColor),
        ),
      ),
      backgroundColor: AppColor.seconndryColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/images/soura_details.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  surahModel.arabicSuraName,
                  style: TextStyle(color: AppColor.mainColor),
                ),
                SizedBox(height: 60),
                Expanded(
                  child: verses.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                          color: AppColor.mainColor,
                        )) // Loading Indicator
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: InkWell(
                                onTap: () {
                                  isRead[index] = true;
                                  setState(() {});
                                },
                                child: VerseWidget(
                                  index: index,
                                  isRead: isRead[index],
                                  verse: verses[index],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 16);
                          },
                          itemCount: verses.length,
                        ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadSuraFile(index) async {
    String suraFile =
        await rootBundle.loadString('assets/files/suras/$index.txt');
    List<String> lines = suraFile.split('\n');
    verses = lines;
    setState(() {
      verses = lines;
      isRead = List<bool>.filled(lines.length, false);
    });
  }
}
