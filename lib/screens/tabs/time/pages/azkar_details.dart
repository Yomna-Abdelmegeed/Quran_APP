import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/helper/colors/app_color.dart';
import 'package:islami/models/azkar_model.dart';

class AzkarDetails extends StatefulWidget {
  const AzkarDetails({super.key});
  static const String routeName = "AzkarDetails";

  @override
  State<AzkarDetails> createState() => _AzkarDetailsState();
}

class _AzkarDetailsState extends State<AzkarDetails> {
  List<bool> isRead = [];
  AzkarModel? model; // Nullable to handle uninitialized state
  bool isLoading = true;
  late int type;
  List<int> isReadInt = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isLoading) {
      type = ModalRoute.of(context)!.settings.arguments as int;
      loadAzkarFile(type);
      if (type == 0) {
        isReadInt = [1, 3, 3, 3, 1, 1, 1, 3, 7];
      } else {
        isReadInt = [1, 3, 3, 3, 1, 1, 1];
      }
    }
  }

  Future<void> loadAzkarFile(int option) async {
    try {
      String azkarFile =
          await rootBundle.loadString('assets/files/azkar/azkar$option.txt');
      List<String> azkar = azkarFile.trim().split('\n');

      if (azkar.isEmpty) {
        throw Exception("Empty Azkar file");
      }

      String title = azkar[0];
      azkar.removeAt(0);

      setState(() {
        model = AzkarModel(
          title: title,
          content: azkar, // Convert list to a string
        );
        isLoading = false;
        isRead = List<bool>.filled(azkar.length, false);
      });
    } catch (e) {
      log("Error loading Azkar file: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.seconndryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.mainColor),
        title: Text(
          isLoading ? "..." : model?.title ?? "Azkar", // Handle null case
          style: TextStyle(color: AppColor.mainColor),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.seconndryColor,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : model == null
              ? Center(child: Text("Failed to load Azkar"))
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      List<String> contentLines = model!.content;
                      return GestureDetector(
                        onTap: () {
                          if (isReadInt[index] > 0) {
                            isReadInt[index] -= 1;
                            if (isReadInt[index] == 0) {
                              isRead[index] = true;
                            }
                            setState(() {});
                          }
                        },
                        child: AnimatedContainer(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              top: 24, right: 8, bottom: 12, left: 12),
                          decoration: BoxDecoration(
                            color: isRead[index]
                                ? AppColor.mainColor
                                : Colors.transparent,
                            border: Border.all(
                              color: AppColor.mainColor,
                              width: 1.3,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          curve: Curves.bounceInOut,
                          duration: Duration(milliseconds: 500),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    contentLines[index],
                                    style: TextStyle(
                                      color: isRead[index]
                                          ? AppColor.seconndryColor
                                          : AppColor.mainColor,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: CircleAvatar(
                                  backgroundColor: AppColor.mainColor,
                                  radius: 16,
                                  child: Text(
                                    '${isReadInt[index]}',
                                    style: TextStyle(
                                        color: isRead[index]
                                            ? AppColor.mainColor
                                            : AppColor.seconndryColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 20);
                    },
                    itemCount: model!.content.length,
                  ),
                ),
    );
  }
}
