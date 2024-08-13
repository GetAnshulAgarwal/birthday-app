import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class GiftScreen extends StatefulWidget {
  const GiftScreen({Key? key}) : super(key: key);

  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<bool> _giftsOpened;
  bool _showFinalGift = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _giftsOpened = List.generate(4, (index) => false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openGift(int index) {
    setState(() {
      _giftsOpened[index] = true;
      if (_giftsOpened.every((opened) => opened)) {
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            _showFinalGift = true;
          });
        });
      }
    });
    _controller.forward().then((_) => _controller.reverse());
  }

  Future<void> _navigateToSpecialGift() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SpecialGiftScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C27B0), // Purple color
        title: const Text('Gifts'),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFEDE7F6), // Light purple background
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 4; i++)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () => _openGift(i),
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _giftsOpened[i] ? 1.0 : 1.1,
                          child: AnimatedOpacity(
                            opacity: _giftsOpened[i] ? 1.0 : 1.0,
                            duration: const Duration(milliseconds: 300),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: _giftsOpened[i]
                                          ? SizedBox(
                                              width: 150,
                                              height: 150,
                                              child: Lottie.asset(
                                                'assets/animation_${i + 1}.json', // Lottie animation asset
                                                repeat: false,
                                                controller: _controller,
                                              ),
                                            )
                                          : Image.asset(
                                              'assets/gift_${i + 1}.jpg', // Gift images
                                              width: 150,
                                              height: 150,
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  _getGiftMessage(i),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              if (_showFinalGift)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: _navigateToSpecialGift,
                    child: const Text('Special Gift'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                ),
              const SizedBox(height: 20), // Added space at the bottom
            ],
          ),
        ),
      ),
    );
  }

  String _getGiftMessage(int index) {
    // Unique gratitude messages for each gift
    const messages = [
      'Thank you for your endless love and support.',
      'You make every day special just by being you.',
      'Your kindness and strength inspire us daily.',
      'Wishing you all the happiness in the world today and always!'
    ];
    return messages[index];
  }
}

class SpecialGiftScreen extends StatelessWidget {
  const SpecialGiftScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C27B0), // Purple color
        title: const Text('Special Gift'),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFEDE7F6), // Light purple background
      body: Center(
        child: GestureDetector(
          onTap: () {
            final url =
                'https://www.amazon.in/Incredible-Gifts-India-Beechwood-Frame/dp/B0847LZHRC/ref=sxin_23_pa_sp_search_thematic_sspa?content-id=amzn1.sym.bc795e26-5dd9-4d55-a433-6dcc07786424%3Aamzn1.sym.bc795e26-5dd9-4d55-a433-6dcc07786424&cv_ct_cx=birthday+gift+for+mom&dib=eyJ2IjoiMSJ9.4nceDdJOmwgp5kyiCDFwOL4cqeOpimPYTkAG6iQacGHsssstZACr-l5v96i40UjDg8YcrDFAjEdFiAEiDiOAkg.I-R72mhijsWDC1mhFCX1klLdrB9sH7YMFvZC-bGw2-I&dib_tag=se&keywords=birthday+gift+for+mom&pd_rd_i=B0847LZHRC&pd_rd_r=bba97f9a-d8f5-485b-bf0f-c9060e6b671d&pd_rd_w=LZZ9D&pd_rd_wg=9SZg1&pf_rd_p=bc795e26-5dd9-4d55-a433-6dcc07786424&pf_rd_r=JBWQ47NZAYTF8R0QE3QY&qid=1723567959&sbo=RZvfv%2F%2FHxDF%2BO5021pAnSA%3D%3D&sr=1-2-ced4eeeb-b190-41d6-902a-1ecb3fb8b7c4-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9zZWFyY2hfdGhlbWF0aWM&psc=1';
            launchUrl(Uri.parse(url));
          },
          child: Image.asset(
            'assets/amazon_gift.jpg', // Image for Amazon link
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}
