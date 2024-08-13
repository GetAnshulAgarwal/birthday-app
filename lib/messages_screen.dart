import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playBackgroundMusic();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playBackgroundMusic() async {
    await _audioPlayer.play(AssetSource('calm_song.mp3'));
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4CAF50), // Soft green color
        title: const Text(
          'Special Messages',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cursive', // Cursive font for a personal touch
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFFFF9E3), // Light beige background
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                for (var message in _messages)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3), // Shadow position
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4CAF50), // Matching green color
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            color: Color(0xFF4CAF50), // Green color for divider
                            thickness: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 200,
              height: 200,
              child: Lottie.asset(
                'assets/animation_5.json', // Lottie animation asset
                repeat: true,
                animate: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // List of messages for the screen
  final List<String> _messages = [
    'Thanks mom for your love and support',
    'ALWAYS KEEP SMILING 😁😁',
    'WE LOVE U MUMMY 💓💓',
    'HAPPY BIRTHDAY MUMMY',
  ];
}
