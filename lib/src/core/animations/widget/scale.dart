import 'package:flutter/material.dart';

// Scale Up Animation
class ScaleUpAnimation extends StatelessWidget {
  const ScaleUpAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.5, end: 1),
      duration: duration,
      curve: Curves.easeOutBack,
      builder: (context, double value, _) {
        return Transform.scale(scale: value, child: child);
      },
    );
  }
}

// Scale Down Animation
class ScaleDownAnimation extends StatelessWidget {
  const ScaleDownAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 1, end: 0.5),
      duration: duration,
      curve: Curves.easeInBack,
      builder: (context, double value, _) {
        return Transform.scale(scale: value, child: child);
      },
    );
  }
}
