import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:islami/helper/colors/app_color.dart';
import 'package:islami/models/radio_model.dart';
import 'package:islami/models/reciters_model.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:islami/screens/tabs/radio/widgets/radio_item_card.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0;
  bool isLoading = true;
  String? errorMessage;

  List<Radios> allRadios = [];
  List<Radios> filteredRadios = [];

  List<Reciter> allReciters = [];
  List<Reciter> filteredReciters = [];

  final AudioPlayer audioPlayer = AudioPlayer();
  String? currentPlayingUrl;
  bool isPlaying = false;
  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
    _setupAudioPlayer();
  }

  void _setupAudioPlayer() {
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _fetchData() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      final results = await Future.wait([
        Dio().get("https://mp3quran.net/api/v3/radios?language=ar"),
        Dio().get("https://www.mp3quran.net/api/v3/reciters?language=ar"),
      ]);

      final radioResponse = results[0];
      final reciterResponse = results[1];

      final radioData = RadioModel.fromJson(radioResponse.data);
      final reciterData = RecitersModel.fromJson(reciterResponse.data);

      setState(() {
        allRadios = radioData.radios ?? [];
        filteredRadios = allRadios;

        allReciters = reciterData.reciters ?? [];
        filteredReciters = allReciters;

        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage =
            "Failed to load data. Please check your internet connection.";
      });
    }
  }

  void _togglePlay(String url) async {
    try {
      if (currentPlayingUrl == url) {
        if (isPlaying) {
          await audioPlayer.pause();
        } else {
          await audioPlayer.resume();
        }
      } else {
        await audioPlayer.stop();
        await audioPlayer.play(UrlSource(url));
        currentPlayingUrl = url;
      }
      setState(() {});
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not play audio: $e')),
      );
    }
  }

  void _toggleMute() async {
    try {
      if (isMuted) {
        await audioPlayer.setVolume(1.0);
        isMuted = false;
      } else {
        await audioPlayer.setVolume(0.0);
        isMuted = true;
      }
      setState(() {});
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  String? _getReciterUrl(Reciter reciter) {
    if (reciter.moshaf != null && reciter.moshaf!.isNotEmpty) {
      return reciter.moshaf!.first.getFirstAudioUrl();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
            labels: const ['Radio', 'Reciters'],
            radiusStyle: true,
            onToggle: (index) {
              setState(() {
                selectedIndex = index!;
                filteredRadios = allRadios;
                filteredReciters = allReciters;
              });
            },
          ),
          const SizedBox(height: 16),
          if (isLoading)
            const Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColor.mainColor,
                ),
              ),
            )
          else if (errorMessage != null)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.mainColor,
                        foregroundColor: AppColor.seconndryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _fetchData,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            )
          else if (selectedIndex == 0 && filteredRadios.isEmpty ||
              selectedIndex == 1 && filteredReciters.isEmpty)
            const Expanded(
              child: Center(
                child: Text(
                  'No results found',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                itemCount: selectedIndex == 0
                    ? filteredRadios.length
                    : filteredReciters.length,
                itemBuilder: (context, index) {
                  final String name;
                  final String? url;

                  if (selectedIndex == 0) {
                    name = filteredRadios[index].name?.trim() ?? "";
                    url = filteredRadios[index].url;
                  } else {
                    name = filteredReciters[index].name?.trim() ?? "";
                    url = _getReciterUrl(filteredReciters[index]);
                  }

                  final isCurrentPlaying =
                      currentPlayingUrl == url && url != null;
                  final isCurrentPlayingActive = isCurrentPlaying && isPlaying;

                  return RadioItemCard(
                    name: name,
                    url: url,
                    isCurrentPlaying: isCurrentPlaying,
                    isCurrentPlayingActive: isCurrentPlayingActive,
                    isMuted: isMuted,
                    onPlayToggle: url != null ? () => _togglePlay(url!) : null,
                    onMuteToggle: isCurrentPlaying ? _toggleMute : null,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
