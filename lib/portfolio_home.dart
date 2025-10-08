import 'package:flutter/material.dart';

import 'about_section.dart';
import 'contact_section.dart';
import 'floating_background.dart';
import 'footer.dart';
import 'hero_section.dart';
import 'projects_section.dart';
import 'top_nav.dart';

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollToKey(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  final heroKey = GlobalKey();
  final projectsKey = GlobalKey();
  final aboutKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= 900;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(68),

        child: TopNav(
          onSelect: (section) {
            switch (section) {
              case 'home':
                scrollToKey(heroKey);
                break;
              case 'projects':
                scrollToKey(projectsKey);
                break;
              case 'about':
                scrollToKey(aboutKey);
                break;
              case 'contact':
                scrollToKey(contactKey);
                break;
            }
          },
        ),
      ),
      body: Stack(
        children: [
          FloatingBackground(scrollController: scrollController),
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(
                  key: heroKey,
                  child: HeroSection(
                    isDesktop: isDesktop,
                    onContactTap: () => scrollToKey(contactKey),
                    onProjectsTap: () => scrollToKey(projectsKey),
                  ),
                ),
                Container(
                  key: projectsKey,
                  child: ProjectsSection(isDesktop: isDesktop),
                ),
                Container(
                  key: aboutKey,
                  child: AboutSection(isDesktop: isDesktop),
                ),
                Container(key: contactKey, child: ContactSection()),
                const SizedBox(height: 40),
                const Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
