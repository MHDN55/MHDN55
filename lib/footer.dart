import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0x08000000),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      child: Center(
        child: Text(
          '© ${DateTime.now().year} Mohammad Nashawi — Built with Flutter',
          style: const TextStyle(color: Colors.white54),
        ),
      ),
    );
  }
}
