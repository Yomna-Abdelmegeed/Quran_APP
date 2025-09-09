import 'package:flutter/material.dart';
import 'package:islami/models/surah_model.dart';
import 'package:islami/screens/tabs/quran/widgets/most_recently.dart';
import 'package:islami/screens/tabs/quran/widgets/search_widget.dart';
import 'package:islami/screens/tabs/quran/widgets/suras_list.dart';

class QuranTab extends StatefulWidget {
const  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  TextEditingController controller = TextEditingController();
  late FocusNode searchNode;
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(onSearch);
    searchNode = FocusNode();
    searchNode.addListener(onFocusNode);
  }

  onFocusNode() {
    if (searchNode.hasFocus) {
      setState(() {
        isSearch = true;
      });
    } else {
      setState(() {
        isSearch = false;
      });
    }
  }

  onSearch() {
    SurahModel.searchSurasIndex.clear();
    String text = controller.text;
    int counter = -1;
    if (text.isNotEmpty) {
      counter = -1;
      for (String data in SurahModel.englishQuranSurahs) {
        counter++;
        if (data.toLowerCase().contains(text.toLowerCase())) {
          // print(counter);
          if (!SurahModel.searchSurasIndex.contains(counter)) {
            SurahModel.searchSurasIndex.add(counter);
          }
        }
      }

      counter = -1;
      for (String data in SurahModel.arabicAuranSuras) {
        counter++;
        if (data.contains(text)) {
          // print(counter);
          if (!SurahModel.searchSurasIndex.contains(counter)) {
            SurahModel.searchSurasIndex.add(counter);
          }
        }
      }
    }
    // print('------------------------------------------');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: SearchWidget(
            controller: controller,
            searchNode: searchNode,
          ),
        ),
        AnimatedSwitcher(
          switchInCurve: Curves.easeInCubic,
          switchOutCurve: Curves.easeInOut,
          duration: Duration(seconds: 2),
          child: SurahModel.searchSurasIndex.isEmpty && !isSearch
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text('Most Recently',
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: SurahModel.englishQuranSurahs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MostRecently(
                            index: index,
                            surahModel: SurahModel.getsurah(index: index),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('Suras List',
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                  ],
                )
              : SizedBox(height: 1),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
              padding: EdgeInsets.only(top: 8),
              itemCount: SurahModel.searchSurasIndex.isNotEmpty
                  ? SurahModel.searchSurasIndex.length
                  : SurahModel.englishQuranSurahs.length,
              itemBuilder: (BuildContext context, int index) {
                return SurasList(
                  index: SurahModel.searchSurasIndex.isNotEmpty
                      ? SurahModel.searchSurasIndex[index]
                      : index,
                  surahModel: SurahModel.searchSurasIndex.isNotEmpty
                      ? SurahModel.getsurah(
                          index: SurahModel.searchSurasIndex[index])
                      : SurahModel.getsurah(index: index),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  indent: 64,
                  endIndent: 64,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
