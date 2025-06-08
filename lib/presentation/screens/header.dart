import 'package:flutter/material.dart';
import 'package:my_portfolio/presentation/screens/projects.dart';
import 'package:my_portfolio/presentation/screens/home.dart';
import 'package:my_portfolio/presentation/screens/skils.dart';

import 'contct.dart';
// استورد الأقسام لو عندك Skills و Contact مثلاً

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final ScrollController _scrollController = ScrollController();

  // مفاتيح لكل قسم عشان نقدر نعمل scroll له
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _navButton(String label, GlobalKey key) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextButton(
        onPressed: () {
          scrollToSection(key);
        },
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fekry.dev',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          _navButton('Home', _homeKey),
          _navButton('Projects', _projectsKey),
          _navButton('Skills', _skillsKey),
          _navButton('Contact', _contactKey),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              key: _homeKey,
              child: HomeSection(),
            ),
            Container(
              key: _projectsKey,
              child: ProjectsSection(),
            ),
            Container(
              key: _skillsKey,
              child: SkillsSection(), // لازم تعمل import لـ SkillsSection أو تنشئها
            ),
            Container(
              key: _contactKey,
              child: ContactSection(), // نفس الشيء لـ ContactSection
            ),
          ],
        ),
      ),
    );
  }
}
