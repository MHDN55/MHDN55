import 'package:flutter/material.dart';
import 'package:portfolio/generated/assets.dart';
import 'Animated_phone.dart';

class HeroSection extends StatelessWidget {
  final bool isDesktop;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const HeroSection({
    required this.isDesktop,
    required this.onProjectsTap,
    required this.onContactTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final title = const Text(
      'Hi, I\'m Mohammad Nashawi 👋',
      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    );

    final subtitle = const Text(
      'Flutter Developer | Clean Architecture Enthusiast',
      style: TextStyle(fontSize: 18, color: Colors.white70),
    );

    final ctaButtons = Row(
      children: [
        ElevatedButton(
          onPressed: onProjectsTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyanAccent,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          ),
          child: const Text('View My Projects'),
        ),
        const SizedBox(width: 12),
        OutlinedButton(
          onPressed: onContactTap,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.cyanAccent),
          ),
          child: const Text('Contact Me'),
        ),
      ],
    );

    final illustration = AnimatedPhone(
      screenImages: [
        Assets.assetsCashMobile1,
        Assets.assetsCashMobile2,
        Assets.assetsCashMobile3,
        Assets.assetsMusicaly1,
        Assets.assetsMusicaly2,
        Assets.assetsMusicaly3,
        Assets.assetsECommerce1,
        Assets.assetsECommerce2,
        Assets.assetsECommerce3,
        Assets.assetsOeg1,
        Assets.assetsOeg2,
        Assets.assetsOeg3,
        Assets.assetsSwaqla1,
        Assets.assetsSwaqla2,
        Assets.assetsSwaqla3,
        Assets.assetsSetalkel1,
        Assets.assetsSetalkel2,
        Assets.assetsSetalkel3,
        Assets.assetsOffers2,
        Assets.assetsOffers3,
      ],
      width: isDesktop ? 320 : 260,
      height: isDesktop ? 640 : 520,
      autoScroll: true,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
      child: isDesktop
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title,
                      const SizedBox(height: 12),
                      subtitle,
                      const SizedBox(height: 20),
                      ctaButtons,
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(flex: 4, child: Center(child: illustration)),
              ],
            )
          : Column(
              children: [
                title,
                const SizedBox(height: 12),
                subtitle,
                const SizedBox(height: 20),
                illustration,
                const SizedBox(height: 20),
                ctaButtons,
              ],
            ),
    );
  }
}
