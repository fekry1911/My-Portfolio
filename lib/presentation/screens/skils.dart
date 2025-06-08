import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double maxWidth = constraints.maxWidth;

        double spacing = 16;
        double runSpacing = 16;
        double chipMaxWidth = maxWidth >= 800 ? 250 : double.infinity;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Skills',
                style: TextStyle(
                  fontSize: maxWidth > 600 ? 36 : 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: spacing,
                runSpacing: runSpacing,
                children: _skills.map((skill) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: chipMaxWidth),
                    child: _skillChip(skill),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _skillChip(String skill) {
    return Chip(
      label: Text(
        skill,
      ),
      backgroundColor: Colors.grey[800],
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.withOpacity(0.5)),
      ),
    ).animate()
        .fadeIn(duration: 800.ms)
        .slideY(begin: 0.3);
  }

  static const List<String> _skills = [
    'Flutter',
    'Dart',
    'Firebase',
    'Kotlin',
    'REST APIs',
    'Bloc, Cubit',
    'Object-Oriented Programming (OOP)',
    'SOLID Principles',
    'Git',
    'UI/UX Design',
    'Payment Integration',
  ];
}
