import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSection extends StatelessWidget {
  final VoidCallback? onViewProjectsPressed;
  const HomeSection({super.key, this.onViewProjectsPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hi, I\'m Abdulrahman Fekry\nFlutter Developer',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )
                .animate()
                .fadeIn(duration: 800.ms)
                .slideY(begin: 0.3),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                launchUrl(
                  Uri.parse('https://drive.google.com/uc?export=download&id=1Ep8RL5Z5bvikOAQbQk4ojDxG9hTjtrx0'),
                  mode: LaunchMode.externalApplication,
                );
              },
              child: const Text('Download CV'),
            )
                .animate()
                .scale(duration: 500.ms)
                .fadeIn(delay: 600.ms),
          ],
        )
        ,
      ),
    );
  }
}
