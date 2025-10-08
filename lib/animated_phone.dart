import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnimatedPhone extends StatefulWidget {
  final List<String> screenImages;
  final double width;
  final double height;
  final bool autoScroll;

  const AnimatedPhone({
    required this.screenImages,
    required this.width,
    required this.height,
    this.autoScroll = true,
    super.key,
  });

  @override
  State<AnimatedPhone> createState() => _AnimatedPhoneState();
}

class _AnimatedPhoneState extends State<AnimatedPhone>
    with SingleTickerProviderStateMixin {
  late final PageController _pageController;
  Timer? _timer;
  double _tilt = 0.0;
  bool _hovering = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    if (widget.autoScroll && widget.screenImages.length > 1) {
      _timer = Timer.periodic(const Duration(seconds: 3), (t) {
        if (!mounted) return;
        if (_hovering) return; // pause when hovering
        int next = (_pageController.page?.round() ?? 0) + 1;
        if (next >= widget.screenImages.length) next = 0;
        _pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _onHover(bool hovering) {
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) return;
    setState(() {
      _hovering = hovering;
      _tilt = hovering ? 0.09 : 0.0; // radians
    });
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = 28.0;
    final phoneFrame = Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: const LinearGradient(
          colors: [Color(0xFF0A1220), Color(0xFF071024)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 28,
            offset: const Offset(0, 18),
          ),
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(0.03),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius - 4),
        child: Container(
          color: Colors.black,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.screenImages.length,
            itemBuilder: (context, index) {
              final path = widget.screenImages[index];
              return Container(
                color: Colors.black,
                child: Image.asset(
                  path,
                  fit: BoxFit.fill,
                  errorBuilder: (_, __, ___) {
                    return Center(
                      child: Text(
                        'Replace\n$path',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white54),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );

    final rotated = AnimatedRotation(
      turns: _tilt / (2 * 3.14159),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
      child: phoneFrame,
    );

    // show MouseRegion only on desktop/web to get hover tilt:
    if (kIsWeb ||
        [
          TargetPlatform.macOS,
          TargetPlatform.windows,
          TargetPlatform.linux,
        ].contains(defaultTargetPlatform)) {
      return MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: rotated,
      );
    } else {
      return GestureDetector(
        onTapDown: (_) => _onHover(true),
        onTapUp: (_) => _onHover(false),
        onTapCancel: () => _onHover(false),
        child: rotated,
      );
    }
  }
}
