import 'package:flutter/material.dart';

class AnimatedSquare extends StatefulWidget {
  final Duration duration;
  const AnimatedSquare({
    Key? key,
    this.duration = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  State<AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: widget.duration);
    colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);
    sizeAnimation = Tween<double>(begin: 100.0, end: 200.0).animate(controller);
    controller
      ..forward()
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat(reverse: true);
        }
      });
  }

  @override
  Widget build(BuildContext context) => Container(
        height: sizeAnimation.value,
        width: sizeAnimation.value,
        color: colorAnimation.value,
      );
}
