import 'package:flutter/material.dart';

class TranslateRightAnimation extends StatelessWidget {
  const TranslateRightAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: -2, end: 0),
      duration: duration,
      curve: Curves.fastOutSlowIn,
      builder: (context, double value, _) {
        return Transform.translate(
          offset: Offset(width * value * -1, 0),
          child: child,
        );
      },
    );
  }
}

// Left to Center Animation
class TranslateLeftAnimation extends StatelessWidget {
  const TranslateLeftAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 2, end: 0),
      duration: duration,
      curve: Curves.fastOutSlowIn,
      builder: (context, double value, _) {
        return Transform.translate(
          offset: Offset(width * value, 0),
          child: child,
        );
      },
    );
  }
}

// Top to Bottom Animation
class TranslateTopToBottomAnimation extends StatelessWidget {
  const TranslateTopToBottomAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: -2, end: 0),
      duration: duration,
      curve: Curves.fastOutSlowIn,
      builder: (context, double value, _) {
        return Transform.translate(
          offset: Offset(0, height * value * -1),
          child: child,
        );
      },
    );
  }
}

// Bottom to Center Animation
class TranslateBottomToCenterAnimation extends StatelessWidget {
  const TranslateBottomToCenterAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 2, end: 0),
      duration: duration,
      curve: Curves.fastOutSlowIn,
      builder: (context, double value, _) {
        return Transform.translate(
          offset: Offset(0, height * value),
          child: child,
        );
      },
    );
  }
}
