import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({
    super.key,
    this.color = Colors.black,
    this.height = 5.0,
  });
  final Color color;
  final double height;
  @override
  createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double screenWidth = 0.0; // Screen width to be dynamically set

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Duration of the animation
      vsync: this,
    )..repeat(reverse: false); // Repeat the animation indefinitely

    // Define a Tween for animating the container from off-screen left to the end of the screen.
    _animation = Tween<double>(begin: -1, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width dynamically using MediaQuery
    screenWidth = MediaQuery.sizeOf(context).width;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Calculate the position of the container
        double offsetX = _animation.value * screenWidth;
        return Transform.translate(
          offset: Offset(offsetX, 0), // Move container horizontally
          child: Container(
            //0.6- 60% of the screen width for loading bar
            width: screenWidth * 1,
            height: widget.height, // Height of the loading bar
            color: widget.color, // Color of the loading bar
          ),
        );
      },
    );
  }
}
