import 'package:flutter/material.dart';
import 'package:islami/helper/colors/app_color.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ToggleSwitch(
            minWidth: double.infinity,
            minHeight: 40,
            cornerRadius: 12,
            fontSize: 16,
            activeBgColors: [
              [AppColor.mainColor],
              [AppColor.mainColor]
            ],
            activeFgColor: AppColor.seconndryColor,
            inactiveBgColor: const Color.fromARGB(178, 32, 32, 32),
            inactiveFgColor: Colors.white,
            initialLabelIndex: selectedIndex,
            totalSwitches: 2,
            labels: ['Radio', 'Reciters'],
            radiusStyle: true,
            onToggle: (index) {
              setState(() {
                selectedIndex = index!;
              });
            },
          ),
          const SizedBox(height: 20),
          if (selectedIndex == 0)
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.13,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.mainColor,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage('assets/images/mosque_bg.png'),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Radio Ibrahim Al-Akdar',
                        style: TextStyle(
                            color: AppColor.seconndryColor, fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.play_arrow_rounded,
                              size: 55,
                            ),
                            color: AppColor.seconndryColor,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.volume_up_rounded,
                              size: 35,
                            ),
                            color: AppColor.seconndryColor,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
              ],
            )
          else
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.13,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.mainColor,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage('assets/images/mosque_bg.png'),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Ibrahim Al-Akdar',
                        style: TextStyle(
                            color: AppColor.seconndryColor, fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.play_arrow_rounded,
                              size: 55,
                            ),
                            color: AppColor.seconndryColor,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.volume_up_rounded,
                              size: 35,
                            ),
                            color: AppColor.seconndryColor,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
              ],
            )
        ],
      ),
    );
  }
}
