import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/helper/colors/app_color.dart';
import 'package:islami/models/hadith_model.dart';
import 'package:islami/screens/tabs/hadith/hadith_details.dart';

class HadithTab extends StatefulWidget {
  HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithModel> listOfHadith = [];

  @override
  void initState() {
    super.initState();
    getHadith();
  }

  @override
  Widget build(BuildContext context) {
    return listOfHadith.isEmpty
        ? Center(
            child: CircularProgressIndicator(
              color: AppColor.mainColor,
            ),
          )
        : CarouselSlider(
            options: CarouselOptions(
                height: double.infinity,
                initialPage: 0,
                enlargeCenterPage: true,
                enlargeFactor: 0.22),
            items: listOfHadith.map((hadith) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HadithDetails.routeName,
                          arguments: hadith);
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                              right: 0, left: 0, top: 8, bottom: 0),
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: AppColor.mainColor,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Container(
                            // margin: EdgeInsets.only(
                            //     right: 5, left: 5, top: 0, bottom: 0),
                            // padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/images/hadeth_bG.png')),
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 40),
                              Text(
                                hadith.title,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.seconndryColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      hadith.content.join('\n'),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: AppColor.seconndryColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          );
  }

  void getHadith() async {
    List<HadithModel> hadithList = [];
    for (int i = 1; i <= 50; i++) {
      try {
        String file =
            await rootBundle.loadString('assets/files/hadeeth/h$i.txt');
        List<String> hadithLines = file.trim().split('\n');
        String title = hadithLines.first;
        hadithLines.removeAt(0);
        hadithList
            .add(HadithModel(title: title, content: hadithLines, index: i));
      } catch (error) {
        print("Error loading hadith $i: $error");
      }
    }

    setState(() {
      listOfHadith = hadithList;
    });
  }
}
