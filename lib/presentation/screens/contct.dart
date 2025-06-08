import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      height: MediaQuery.of(context).size.height/2,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Me',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ).animate()
          .fadeIn(duration: 800.ms)
          .slideY(begin: 0.3),
          SizedBox(height: 20),
          Text(
            'Email: abdofekryasda@gmail.com',
            style: TextStyle(fontSize: 18),
          ).animate()
              .fadeIn(duration: 800.ms)
              .slideY(begin: 0.3),
          SizedBox(height: 10),
          Text(
            'Phone: +20 1044577394',
            style: TextStyle(fontSize: 18),
          ).animate()
              .fadeIn(duration: 800.ms)
              .slideY(begin: 0.3),
          SizedBox(height: 20),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.facebook),
                onPressed: () {
                  launchUrl(Uri.parse("https://www.facebook.com/abdo.gabr.144"));
                },
              ),
              IconButton(
                icon: Icon(MdiIcons.linkedin),
                onPressed: () {
                  launchUrl(Uri.parse("https://www.linkedin.com/in/abdulrahman-fekry-a641531a1/"));
                },
              ),
              IconButton(
                icon: Icon(MdiIcons.github),
                onPressed: () {
                  launchUrl(Uri.parse("https://github.com/fekry1911"));
                },
              ),
            ],
          ).animate()
              .fadeIn(duration: 800.ms)
              .slideY(begin: 0.3),
        ],
      ),
    );
  }
}
