import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  // create an instance of the Music player
  final player = AudioPlayer();
  bool isPlaying = false;

  // setting the duration
  Duration? duration = const Duration(seconds: 0);
  Duration position = Duration.zero;
  double currentSliderValue = 0;

  // create a function to initiate the music into player
  void initPlayer() async {
    await player.setSource(AssetSource("music.mp3"));
    duration = await player.getDuration();
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
    // setAudio();
    //
    // // Listen to state: playing, paused, stopped
    // player.onPlayerStateChanged.listen((state) {
    //   setState(() {
    //     isPlaying = state == PlayerState.playing;
    //   });
    // });
    // // Listen to audio duration
    // player.onDurationChanged.listen((newDuration) {
    //   setState(() {
    //     duration = newDuration;
    //   });
    // });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "지금 당신이 듣는 음악",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                'https://cdnimg.melon.co.kr/cm2/album/images/103/59/162/10359162_500.jpg?8ff540be5e6849f5bfaef3741bb72793',
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Text('Counting Stars(Feat.Beenzino)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 32),
          const Text('비오', style: TextStyle(fontSize: 20)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('00:00'),
                Slider.adaptive(
                    value: 0, onChanged: (value) {}, activeColor: Colors.white),
                //Expanded(child: SizedBox()),
                Text('${duration!.inMinutes} : ${duration!.inSeconds % 60}'),
                //Text(format(Duration position)=> position.toString()),
                //Text(formatTime(duration - position)),
              ],
            ),
          ),
          CircleAvatar(
            radius: 35,
            child: IconButton(
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
              ),
              iconSize: 50,
              onPressed: () async {
                if (isPlaying) {
                  await player.pause();
                } else {
                  await player.resume();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future setAudio() async {
    // repeat song when completed
    player.setReleaseMode(ReleaseMode.loop);
    // Load audio from URL
    String url = 'https://youtu.be/mLCsbacHxA8';
    player.setSourceUrl(url);
  }
}
