import 'package:flutter/material.dart';
import '../widgets/appbar.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  static const Color goldColor = Color(0xFFE2BE7F);
  static const Color darkBackground = Color(0xFF121212);

  final List<Map<String, String>> introData = [
    {
      "image": "assets/images/intro1.png",
      "title": "Welcome To Islami App",
      "desc": ""
    },
    {
      "image": "assets/images/intro2.png",
      "title": "Welcome To Islami",
      "desc": "We Are Very Excited To Have You In Our Community"
    },
    {
      "image": "assets/images/intro3.png",
      "title": "Reading the Quran",
      "desc": "Read, and your Lord is the Most Generous"
    },
    {
      "image": "assets/images/intro4.png",
      "title": "Bearish",
      "desc": "Praise the name of your Lord, the Most High"
    },
    {
      "image": "assets/images/intro5.png",
      "title": "Holy Quran Radio",
      "desc": "You can listen to the Holy Quran Radio"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackground,
      body: Column(
        children: [
          const IntroAppBar(),

          const SizedBox(height: 24),

          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: introData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Flexible(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            introData[index]["image"]!,
                            height: 400,
                          ),
                          const SizedBox(height: 35),
                          Container(
                            width: 398,
                            height: 45,
                            alignment: Alignment.center,
                            child: Text(
                              introData[index]["title"]!,
                              style: const TextStyle(
                                color: goldColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        introData[index]["desc"]!,
                        style: TextStyle(
                          color: goldColor.withOpacity(0.8),
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                currentIndex == 0
                    ? const SizedBox(width: 60)
                    : TextButton(
                  onPressed: () {
                    _controller.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Text(
                    "Back",
                    style: TextStyle(
                      color: goldColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      introData.length,
                          (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: currentIndex == index ? 18 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? goldColor
                              : goldColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (currentIndex < introData.length - 1) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      color: goldColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}