import 'package:flutter/material.dart';
import 'memories.dart';
import 'cake_time.dart';
import 'gift_screen.dart';
import 'messages_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE0B2), // Warm peach background
      appBar: AppBar(
        backgroundColor: const Color(0xFFE57373), // Soft pinkish-red color
        title: const Text(
          'Happy Birthday, Mom!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cursive', // Add a cursive font for a personal touch
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              '🎉 Special Day for a Special Mom 🎉',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cursive',
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/cake.jpeg', // Replace with an image of a birthday cake
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Wishing you a day filled with love and joy!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildFeatureCard(
                    context,
                    icon: Icons.card_giftcard,
                    title: 'Gifts',
                    color: Colors.pinkAccent,
                    screen: GiftScreen(),
                  ),
                  _buildFeatureCard(
                    context,
                    icon: Icons.photo_album,
                    title: 'Memories',
                    color: Colors.lightBlueAccent,
                    screen: MemoriesScreen(),
                  ),
                  _buildFeatureCard(
                    context,
                    icon: Icons.cake,
                    title: 'Cake Time',
                    color: Colors.greenAccent,
                    screen: CakeTimeScreen(),
                  ),
                  _buildFeatureCard(
                    context,
                    icon: Icons.favorite,
                    title: 'Messages',
                    color: Colors.purpleAccent,
                    screen: MessageScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context,
      {required IconData icon,
      required String title,
      required Color color,
      required Widget screen}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: color,
      child: InkWell(
        onTap: () {
          // Navigate to the corresponding screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 48,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cursive',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
