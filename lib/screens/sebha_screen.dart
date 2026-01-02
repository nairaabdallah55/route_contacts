import 'package:flutter/material.dart';
import '../widgets/appbar.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({super.key});

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen>
    with SingleTickerProviderStateMixin {
  int count = 0;
  final String tasbeehText = "سبحان الله";

  static const Color goldColor = Color(0xFFE2BE7F);

  late AnimationController _controller;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _shakeAnimation = Tween<double>(
      begin: -0.05,
      end: 0.05,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTasbeehTap() {
    setState(() {
      count++;
    });

    _controller.forward().then((_) {
      _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/Background.png",
              fit: BoxFit.cover,
            ),
          ),

          Column(
            children: [
              const IntroAppBar(),
              const SizedBox(height: 20),

              const Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 37,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: _onTasbeehTap,
                    child: AnimatedBuilder(
                      animation: _shakeAnimation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _shakeAnimation.value,
                          child: child,
                        );
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/images/SebhaBody.png",
                            width: 379,
                          ),
                          Positioned(
                            top: -81,
                            child: Image.asset(
                              "assets/images/sebha2.png",
                              width: 145,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                tasbeehText,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "$count",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 75,
                    width: double.infinity,
                    color: goldColor,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _bottomIcon("assets/images/Vector2.png", () {}),
                            const SizedBox(height: 4),
                            const SizedBox(height: 10),
                          ],
                        ),

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _bottomIcon("assets/images/book.png", () {}),
                            const SizedBox(height: 4),
                            const SizedBox(height: 10),
                          ],
                        ),

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _bottomIcon("assets/images/necklace.png", () {}),
                            const SizedBox(height: 4),
                            const Text(
                              "Hadith",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _bottomIcon("assets/images/radio.png", () {}),
                            const SizedBox(height: 4),
                            const SizedBox(height: 10),
                          ],
                        ),

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _bottomIcon("assets/images/Vector3.png", () {}),
                            const SizedBox(height: 4),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomIcon(String imagePath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        width: 40,
        height: 40,
      ),
    );
  }
}