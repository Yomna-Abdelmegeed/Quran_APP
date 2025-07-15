import 'package:flutter/material.dart';
import 'package:islami/helper/colors/app_color.dart';

class VerseWidget extends StatelessWidget {
  const VerseWidget(
      {super.key,
      required this.index,
      required this.isRead,
      required this.verse});
  final int index;
  final bool isRead;
  final String verse;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: isRead ? AppColor.mainColor : Colors.transparent,
        border: Border.all(
          color: AppColor.mainColor,
          width: 1.3,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Text(
            '[${index + 1}] ',
            style: TextStyle(
              color: isRead ? AppColor.seconndryColor : AppColor.mainColor,
            ),
          ),
          Expanded(
            child: Text(verse,
                style: TextStyle(
                    color:
                        isRead ? AppColor.seconndryColor : AppColor.mainColor)),
          ),
        ],
      ),
    );
  }
}
