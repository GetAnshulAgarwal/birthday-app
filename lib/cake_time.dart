import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'dart:math'; // Import dart:math for mathematical operations

class CakeTimeScreen extends StatefulWidget {
  const CakeTimeScreen({super.key});

  @override
  _CakeTimeScreenState createState() => _CakeTimeScreenState();
}

class _CakeTimeScreenState extends State<CakeTimeScreen> {
  late AudioPlayer _audioPlayer;
  late ConfettiController _confettiController;
  bool _cakeCut = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 5));
    _playSong();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  void _playSong() async {
    // Replace with the path or URL to your Hindi birthday song
    await _audioPlayer.play(AssetSource('hindi_birthday_song.mp3'));
  }

  void _cutCake() {
    setState(() {
      _cakeCut = true;
    });
    _confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0), // Light soft peach color
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFAB91), // Soft pink color
        title: const Text('Cake Time!'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Happy Birthday!',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cursive',
              ),
            ),
            const SizedBox(height: 20),
            _cakeCut
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/0.jpg', // Left half of the cake
                        width: 150,
                        height: 150,
                      ),
                      Image.asset(
                        'assets/1.jpg', // Right half of the cake
                        width: 150,
                        height: 150,
                      ),
                    ],
                  )
                : Image.asset(
                    'assets/cake2.png', // Full cake image
                    width: 200,
                    height: 200,
                  ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _cutCake,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Cut the Cake 🎂',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ConfettiWidget(
        confettiController: _confettiController,
        blastDirectionality: BlastDirectionality.explosive,
        shouldLoop: false,
        colors: const [
          Colors.pink,
          Colors.orange,
          Colors.yellow,
          Colors.green,
          Colors.blue
        ],
        createParticlePath: drawStar, // Optional: Creates star-shaped particles
        numberOfParticles: 100, // Increase the number of particles
        emissionFrequency: 0.05, // Increase emission frequency
      ),
    );
  }

  // Optional: Creates star-shaped particles
  Path drawStar(Size size) {
    final Path path = Path();
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2;
    const double angle = (2 * pi) / 5; // Use pi from dart:math
    path.moveTo(centerX, centerY - radius);
    for (int i = 1; i < 5; i++) {
      path.lineTo(
          centerX + radius * sin(i * angle), centerY - radius * cos(i * angle));
    }
    path.close();
    return path;
  }
}
