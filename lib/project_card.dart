import 'package:flutter/material.dart';

import 'Animated_phone.dart';
import 'functions.dart';
import 'project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final double width;
  const ProjectCard({required this.project, required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    final phone = AnimatedPhone(
      screenImages: project.screens,
      width: 220,
      height: 460,
      autoScroll: true,
    );

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: const Color(0x0AFFFFFF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          phone,
          const SizedBox(height: 12),
          Text(
            project.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            project.description,
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: project.tech.map((t) => Chip(label: Text(t))).toList(),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () => launchUrlStringSafe(project.playStore),
                icon: const Icon(Icons.shop),
                label: const Text('Play Store'),
              ),
              const SizedBox(width: 8),
              TextButton.icon(
                onPressed: () => launchUrlStringSafe(project.github),
                icon: const Icon(Icons.code),
                label: const Text('GitHub'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
