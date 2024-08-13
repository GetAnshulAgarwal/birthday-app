import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';

class MemoriesScreen extends StatefulWidget {
  const MemoriesScreen({super.key});

  @override
  _MemoriesScreenState createState() => _MemoriesScreenState();
}

class _MemoriesScreenState extends State<MemoriesScreen> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playMusic();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playMusic() async {
    try {
      // Ensure your audio file is correctly placed in the assets directory
      // and is correctly referenced in the pubspec.yaml file
      await _audioPlayer.play(AssetSource('maa.mp3'), volume: 0.5);
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5), // Soft lavender color
      appBar: AppBar(
        backgroundColor: const Color(0xFFBA68C8), // Soft purple color
        title: const Text('Memories'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Cherished Moments 💖',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 20),
          CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: [
              'assets/images/memory1.jpg',
              'assets/images/memory2.jpg',
              'assets/images/memory3.jpg',
              'assets/images/memory4.jpg',
              'assets/images/memory5.jpg',
              'assets/images/memory6.jpg',
              'assets/images/memory7.jpg',
              'assets/images/memory8.jpg',
              'assets/images/memory9.jpg',
              'assets/images/memory10.jpg',
              'assets/images/memory11.jpg',
              'assets/images/memory12.jpg',
              'assets/images/memory13.jpg',
              'assets/images/memory14.jpg',
              'assets/images/memory15.jpg',
              'assets/images/memory16.jpg',
              'assets/images/memory17.jpg',
              'assets/images/memory18.jpg',
              'assets/images/memory19.jpg',
              'assets/images/memory20.jpg',
              'assets/images/memory21.jpg',
              'assets/images/memory22.jpg',
              'assets/images/memory319.jpg',
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage(i),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Lottie.asset(
              'assets/animation_6.json', // Replace with your Lottie file
              width: 150,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
