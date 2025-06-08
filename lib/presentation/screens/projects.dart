import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, String>> projects = const [
    {
      'title': 'DocWay',
      'description': 'A medical mobile application that allows users to browse doctors, view specializations, and book appointments with ease.',
      'image': 'assets/img.png',
      'url': 'https://github.com/fekry1911/docway',
    },
    {
      'title': 'ShopSphere App',
      'description': 'E-commerce app with cart, favorites, auth, and payment.',
      'image': 'assets/commerce.jpg',
      'url': 'https://github.com/fekry1911/shopsphere-',
    },
    {
      'title': 'Weather App',
      'description': 'Weather forecast app using OpenWeather API.',
      'image': 'assets/weather.jpg',
      'url': 'https://github.com/fekry1911/weatherApp',
    },
    {
      'title': 'News App',
      'description': 'Simple news app with API integration and filters.',
      'image': 'assets/news.jpeg',
      'url': 'https://github.com/fekry1911/news-app',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;

        // عدد الأعمدة حسب حجم الشاشة
        int crossAxisCount = 1;
        double cardWidth = maxWidth;

        if (maxWidth >= 1200) {
          crossAxisCount = 4;
        } else if (maxWidth >= 800) {
          crossAxisCount = 4;
        }

        cardWidth = (maxWidth - (crossAxisCount - 1) * 24) / crossAxisCount;

        return Container(
          padding: const EdgeInsets.all(32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Projects',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideX(begin: -0.2),
              const SizedBox(height: 32),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                children: projects
                    .map((project) => SizedBox(
                  width: cardWidth,
                  child: _HoverableProjectCard(project: project)
                      .animate()
                      .fadeIn(duration: 500.ms),
                ))
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }

}

class _HoverableProjectCard extends StatefulWidget {
  final Map<String, String> project;
  const _HoverableProjectCard({required this.project, super.key});

  @override
  State<_HoverableProjectCard> createState() => _HoverableProjectCardState();
}

class _HoverableProjectCardState extends State<_HoverableProjectCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 300,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
          boxShadow: _isHovering
              ? [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.6),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ]
              : [
            const BoxShadow(
              color: Colors.black54,
              blurRadius: 12,
              offset: Offset(0, 4),
            )
          ],
        ),
        transform: _isHovering ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                widget.project['image']!,
                width: double.infinity,
                height: 180,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project['title']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _isHovering ? Colors.blueAccent : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.project['description']!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: _isHovering ? Colors.blue[100] : Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isHovering ? Colors.blueAccent : Colors.grey[800],
                    ),
                    onPressed: () => launchUrl(Uri.parse(widget.project['url']!)),
                    child: const Text('View on GitHub'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )..animate()
        .fadeIn(duration: 800.ms)
        .slideY(begin: 0.3);
  }
}
