import 'package:flutter/material.dart';
import 'generated/assets.dart';

class AboutSection extends StatelessWidget {
  final bool isDesktop;
  const AboutSection({required this.isDesktop, super.key});

  @override
  Widget build(BuildContext context) {
    final avatar = Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Color(0xFF1E293B), Color(0xFF071024)],
        ),
        border: Border.all(color: Colors.cyanAccent, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(0.4),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(Assets.assetsProfile1, fit: BoxFit.cover),
      ),
    );

    final bio = const Text(
      'A dedicated Flutter developer with 2+ years of experience creating modern mobile apps.\n'
      'Focused on Clean Architecture, Bloc state management, and scalable UI design.\n'
      'Strong in performance optimization and software–hardware integration.\n'
      'Open to freelance, full-time, and remote Flutter opportunities.',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white70, height: 1.6, fontSize: 16),
    );

    final skills = Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 8,
      children: const [
        Chip(label: Text('Flutter')),
        Chip(label: Text('Dart')),
        Chip(label: Text('Clean Architecture')),
        Chip(label: Text('Bloc')),
        Chip(label: Text('REST APIs')),
        Chip(label: Text('Git / CI/CD')),
        Chip(label: Text('Firebase')),
      ],
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),

      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              avatar,
              const SizedBox(height: 20),
              const Text(
                'About Me',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(height: 16),
              bio,
              const SizedBox(height: 28),
              skills,
            ],
          ),
        ),
      ),
    );
  }
}
