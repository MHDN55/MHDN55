import 'package:flutter/material.dart';

import 'Animated_phone.dart';
import 'functions.dart';
import 'project.dart';

class ContributionCard extends StatelessWidget {
  final Project project;
  final double width;
  const ContributionCard({
    required this.project,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final phone = AnimatedPhone(
      screenImages: project.screens,
      width: 180,
      height: 380,
      autoScroll: true,
    );

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: const Color(0x0AFFFFFF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          phone,

          const SizedBox(height: 10),
          Text(
            project.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            project.description,
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            children: project.tech.map((t) => Chip(label: Text(t))).toList(),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if ((project.playStore).isNotEmpty)
                TextButton.icon(
                  onPressed: () => launchUrlStringSafe(project.playStore),
                  icon: const Icon(Icons.public),
                  label: const Text('Website'),
                ),
              const SizedBox(width: 8),
              if ((project.github).isNotEmpty)
                TextButton.icon(
                  onPressed: () => launchUrlStringSafe(project.github),
                  icon: const Icon(Icons.code),
                  label: const Text('Code'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
