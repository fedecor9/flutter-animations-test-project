import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class CustomStaggeredAnimation extends StatelessWidget {
  CustomStaggeredAnimation({
    required this.child,
    this.delay = Duration.zero,
    super.key,
  });
  final Widget child;
  final Duration delay;

  final tween = MovieTween()
    ..scene(duration: const Duration(milliseconds: 700), curve: Curves.easeIn)
        //fade in animation
        .tween(
          'fade_in',
          Tween<double>(begin: 0, end: 1),
          shiftEnd: const Duration(milliseconds: -500),
        )
        //rotate animation
        .tween('rotate', Tween<double>(begin: 0, end: 2 * pi))
        //grow animation
        .tween(
          'scale',
          Tween<double>(begin: 0, end: 1),
          shiftEnd: const Duration(milliseconds: -250),
        );

  @override
  Widget build(BuildContext context) => PlayAnimationBuilder(
        delay: delay,
        builder: (BuildContext context, value, Widget? widget) => Opacity(
          opacity: value.get('fade_in'),
          child: Transform(
            transform: Matrix4.identity()
              ..rotateZ(value.get('rotate'))
              ..scale(value.get('scale')),
            alignment: Alignment.center,
            child: widget,
          ),
        ),
        duration: tween.duration,
        tween: tween,
        child: child,
      );
}
