import 'package:flutter/material.dart';

import 'contribution_card.dart';
import 'project.dart';
import 'project_card.dart';
import 'projects_data.dart';
import 'section_title.dart';

class ProjectsSection extends StatelessWidget {
  final bool isDesktop;
  const ProjectsSection({required this.isDesktop, super.key});

  @override
  Widget build(BuildContext context) {
    final featured = featuredProjects;
    final contributions = contributedProjects;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(
            title: 'My Flutter Projects',
            subtitle: 'Apps built with Clean Architecture & Bloc',
          ),
          const SizedBox(height: 18),

          // Featured Projects (full)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Featured Projects',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              if (isDesktop) {
                return Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: featured
                      .map((p) => ProjectCard(project: p, width: 320))
                      .toList(),
                );
              } else {
                return Column(
                  children: featured
                      .map(
                        (p) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ProjectCard(
                            project: p,
                            width: double.infinity,
                          ),
                        ),
                      )
                      .toList(),
                );
              }
            },
          ),

          const SizedBox(height: 28),

          // Contributions / Collaborations
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Contributed / Collaborated',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildContributionsGrid(contributions, isDesktop),
        ],
      ),
    );
  }

  Widget _buildContributionsGrid(List<Project> contributions, bool isDesktop) {
    if (isDesktop) {
      return Wrap(
        spacing: 16,
        runSpacing: 16,
        children: contributions
            .map((p) => ContributionCard(project: p, width: 280))
            .toList(),
      );
    } else {
      return Column(
        children: contributions
            .map(
              (p) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ContributionCard(project: p, width: double.infinity),
              ),
            )
            .toList(),
      );
    }
  }
}
