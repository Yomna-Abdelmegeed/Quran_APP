import 'package:flutter/material.dart';
import 'package:islami/helper/colors/app_color.dart';

class RadioItemCard extends StatelessWidget {
  final String name;
  final String? url;
  final bool isCurrentPlayingActive;
  final bool isCurrentPlaying;
  final bool isMuted;
  final VoidCallback? onPlayToggle;
  final VoidCallback? onMuteToggle;

  const RadioItemCard({
    super.key,
    required this.name,
    required this.url,
    required this.isCurrentPlayingActive,
    required this.isCurrentPlaying,
    required this.isMuted,
    this.onPlayToggle,
    this.onMuteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.13,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.mainColor,
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          alignment: Alignment.bottomCenter,
          image: AssetImage('assets/images/mosque_bg.png'),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              name,
              style: const TextStyle(
                color: AppColor.seconndryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: onPlayToggle,
                icon: Icon(
                  isCurrentPlayingActive
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  size: 45,
                ),
                color: url != null
                    ? AppColor.seconndryColor
                    : AppColor.seconndryColor.withValues(alpha: 0.4),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: onMuteToggle,
                icon: Icon(
                  isCurrentPlaying && isMuted
                      ? Icons.volume_off_rounded
                      : Icons.volume_up_rounded,
                  size: 30,
                ),
                color: isCurrentPlaying
                    ? AppColor.seconndryColor
                    : AppColor.seconndryColor.withValues(alpha: 0.4),
              ),
            ],
          )
        ],
      ),
    );
  }
}
