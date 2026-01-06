import 'package:clz/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThresholdDismissible extends StatefulWidget {
  final Widget child;
  final Future<bool> Function() onConfirm;
  final VoidCallback onDismissed;
  final Color backgroundColor;
  final IconData backgroundIcon;

  const ThresholdDismissible({
    super.key,
    required this.child,
    required this.onConfirm,
    required this.onDismissed,
    this.backgroundColor = Colors.red,
    this.backgroundIcon = Icons.delete,
  });

  @override
  State<ThresholdDismissible> createState() => _ThresholdDismissibleState();
}

class _ThresholdDismissibleState extends State<ThresholdDismissible>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // double _maxDragExtent = 0.0;
  bool _dialogTriggered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.0,
      upperBound: 0.20, // Lock at 25% of widget width
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleDragUpdate(DismissUpdateDetails details) {
    if (!_dialogTriggered) {
      final rawProgress = details.progress;
      final clampedProgress = rawProgress.clamp(0.0, 0.20);

      _controller.value = clampedProgress;

      if (rawProgress >= 0.20 && !_dialogTriggered) {
        _dialogTriggered = true;
        _showConfirmationDialog();
      }
    }
  }

  Future<void> _showConfirmationDialog() async {
    final shouldDismiss = await widget.onConfirm();

    if (shouldDismiss) {
      if (mounted) {
        await _controller.animateTo(1.0); // Complete dismiss animation
        await _controller.animateBack(0.0);
        widget.onDismissed();
      }
    } else {
      if (mounted) {
        await _controller.animateBack(0.0);
        _dialogTriggered = false;
      }
    }
  }

  Widget _buildBackground() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(
            widget.backgroundIcon,
            color: Colors.white.withValues(alpha: _controller.value * 4),
            size: 32,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DismissibleBackground(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // _maxDragExtent = constraints.maxWidth * 0.25;
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.centerRight,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: _buildBackground(),
                  ),
                  Transform.translate(
                    offset: Offset(
                      -_controller.value * (constraints.maxWidth),
                      0,
                    ),
                    child: child,
                  ),
                ],
              );
            },
            child: Dismissible(
              key: widget.key!,
              direction: DismissDirection.endToStart,
              resizeDuration: null,
              movementDuration: Duration(milliseconds: 600),
              onUpdate: _handleDragUpdate,
              confirmDismiss: (_) async => false,
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}

class DismissibleBackground extends StatelessWidget {
  const DismissibleBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.danger,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: child,
    );
  }
}
