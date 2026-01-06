import 'package:flutter/material.dart';

class ShrinkAnimation extends StatefulWidget {
  final Function? onPressed;
  final double shrinkScale;

  final Widget child;
  const ShrinkAnimation({
    super.key,
    required this.onPressed,
    required this.child,
    this.shrinkScale = 0.9,
  });

  @override
  State<ShrinkAnimation> createState() => _ShrinkAnimationState();
}

class _ShrinkAnimationState extends State<ShrinkAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> scale;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    //
    scale = Tween<double>(
      begin: 1.0,
      end: widget.shrinkScale,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    super.initState();
  }

  Future<void> _onTap() async {
    keyboardUnfocus();
    _controller.forward();
    await Future.delayed(
      const Duration(milliseconds: 200),
      () => _controller.reverse(),
    );
    if (widget.onPressed != null) widget.onPressed!();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: ScaleTransition(scale: scale, child: widget.child),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void keyboardUnfocus() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
}
