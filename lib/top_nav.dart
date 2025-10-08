/* ---------- Top Navigation ---------- */
import 'package:flutter/material.dart';

import 'nav_button_widget.dart';

class TopNav extends StatelessWidget {
  final void Function(String section) onSelect;
  const TopNav({required this.onSelect, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: const Text(
        'Mohammad Nashawi',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        NavButton(label: 'Home', onTap: () => onSelect('home')),
        NavButton(label: 'Projects', onTap: () => onSelect('projects')),
        NavButton(label: 'About', onTap: () => onSelect('about')),
        NavButton(label: 'Contact', onTap: () => onSelect('contact')),
        const SizedBox(width: 12),
      ],
    );
  }
}
