import 'package:flutter/material.dart';

import 'functions.dart';
import 'section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  static const _email = 'mohammad.nashawi.55@gmail.com';
  static const _phone = '+963941514698';
  static const _github = 'https://github.com/MHDN55';
  static const _linkedin = 'https://www.linkedin.com/in/mohammad-nashawi0/';

  void _openEmail() => launchUrlStringSafe('mailto:$_email');
  void _openPhone() => launchUrlStringSafe('tel:$_phone');
  void _openGithub() => launchUrlStringSafe(_github);
  void _openLinkedIn() => launchUrlStringSafe(_linkedin);

  @override
  Widget build(BuildContext context) {
    final cardStyle = BoxDecoration(
      color: const Color(0x110FFFFFF),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          blurRadius: 8,
          offset: const Offset(0, 6),
        ),
      ],
    );

    Widget contactCard({
      required IconData icon,
      required String title,
      required String subtitle,
      required VoidCallback onTap,
    }) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(16),
          decoration: cardStyle,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white12,
                ),
                child: Icon(icon, size: 24, color: Colors.cyanAccent),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.white38),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 24),
      child: Column(
        children: [
          const SectionTitle(
            title: 'Contact',
            subtitle: 'Let\'s work together 💬',
          ),
          const SizedBox(height: 18),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                contactCard(
                  icon: Icons.business,
                  title: 'LinkedIn',
                  subtitle: 'View profile',
                  onTap: _openLinkedIn,
                ),
                contactCard(
                  icon: Icons.code,
                  title: 'GitHub',
                  subtitle: _github,
                  onTap: _openGithub,
                ),
                contactCard(
                  icon: Icons.phone,
                  title: 'Phone',
                  subtitle: _phone,
                  onTap: _openPhone,
                ),

                contactCard(
                  icon: Icons.email,
                  title: 'Email',
                  subtitle: _email,
                  onTap: _openEmail,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
