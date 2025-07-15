import 'package:flutter/material.dart';
import 'package:islami/helper/colors/app_color.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget(
      {super.key, required this.controller, required this.searchNode});
  final TextEditingController controller;
  final FocusNode searchNode;
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        focusNode: searchNode,
        decoration: InputDecoration(
          hintText: 'Sura Name',
          hintStyle: Theme.of(context).textTheme.titleMedium,
          prefixIcon: ImageIcon(AssetImage('assets/images/Quran_ic.png')),
          prefixIconColor: AppColor.mainColor,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.mainColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.mainColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        style: TextStyle(color: AppColor.creamyColor));
  }
}
