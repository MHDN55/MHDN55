import 'package:flutter/material.dart';
import 'dart:math' as math;

class FloatingBackground extends StatefulWidget {
  final ScrollController? scrollController; // optional for parallax effect
  const FloatingBackground({this.scrollController, super.key});

  @override
  State<FloatingBackground> createState() => _FloatingBackgroundState();
}

class _FloatingBackgroundState extends State<FloatingBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  final List<_IconConfig> _icons = [
    _IconConfig(
      icon: Icons.code,
      size: 64,
      leftPercent: 0.08,
      topPercent: 0.12,
      amplitude: 26,
      speed: 1.0,
      opacity: 0.12,
      parallaxFactor: 0.12,
    ),
    _IconConfig(
      icon: Icons.flutter_dash,
      size: 68,
      leftPercent: 0.72,
      topPercent: 0.08,
      amplitude: 32,
      speed: 0.8,
      opacity: 0.14,
      parallaxFactor: 0.08,
    ),
    _IconConfig(
      icon: Icons.bolt,
      size: 48,
      leftPercent: 0.45,
      topPercent: 0.3,
      amplitude: 18,
      speed: 1.6,
      opacity: 0.10,
      parallaxFactor: 0.18,
    ),
    _IconConfig(
      icon: Icons.storage,
      size: 56,
      leftPercent: 0.22,
      topPercent: 0.65,
      amplitude: 22,
      speed: 1.2,
      opacity: 0.09,
      parallaxFactor: 0.10,
    ),
    // add / edit configs as you like
  ];

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
    // if you want to rebuild on scroll for parallax, listen to the controller passed in and call setState
    widget.scrollController?.addListener(_onScroll);
  }

  void _onScroll() => setState(() {});

  @override
  void dispose() {
    widget.scrollController?.removeListener(_onScroll);
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Positioned.fill(
      child: IgnorePointer(
        ignoring: true,
        child: AnimatedBuilder(
          animation: _ctrl,
          builder: (context, _) {
            final tBase = _ctrl.value * 2 * math.pi;
           final scroll = (widget.scrollController?.hasClients ?? false)
              ? widget.scrollController!.offset
              : 0.0;
            return Stack(
              children: _icons.map((cfg) {
                // base position relative to screen
                final baseLeft = size.width * cfg.leftPercent;
                final baseTop = size.height * cfg.topPercent;

                // motion using sine/cosine (gentle floating)
                final phase = cfg.phase;
                final x = math.sin(tBase * cfg.speed + phase) * cfg.amplitude;
                final y =
                    math.cos(tBase * (cfg.speed * 0.9) + phase) *
                    (cfg.amplitude * 0.6);

                // parallax shift (moves opposite to scroll to create depth)
                final parallax = -(scroll * cfg.parallaxFactor);

                final left = baseLeft + x;
                final top = baseTop + y + parallax;

                return Positioned(
                  left: left,
                  top: top,
                  child: Transform.rotate(
                    angle:
                        (tBase * 0.12 * cfg.rotationFactor), // subtle rotation
                    child: Opacity(
                      opacity: cfg.opacity,
                      child: Icon(
                        cfg.icon,
                        size: cfg.size,
                        color: cfg.color ?? Colors.cyanAccent,
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}

class _IconConfig {
  final IconData icon;
  final double size;
  final double leftPercent; // 0.0 - 1.0 relative to screen width
  final double topPercent; // 0.0 - 1.0 relative to screen height
  final double amplitude; // px of motion
  final double speed; // motion speed multiplier
  final double opacity;
  final double parallaxFactor; // how much scroll affects it
  final double phase; // random phase offset
  final double rotationFactor;
  final Color? color;

  _IconConfig({
    required this.icon,
    this.size = 48,
    required this.leftPercent,
    required this.topPercent,
    this.amplitude = 20,
    this.speed = 1.0,
    this.opacity = 0.12,
    this.parallaxFactor = 0.0,
    double? phase,
    this.rotationFactor = 1.0,
    this.color,
  }) : phase = phase ?? (math.Random().nextDouble() * math.pi * 2);
}
