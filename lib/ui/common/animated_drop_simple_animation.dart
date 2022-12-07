import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SimpleAnimationsDrop extends StatelessWidget {
  SimpleAnimationsDrop({required this.widget, super.key});
  final Widget widget;

  final dropTween = MovieTween()
    ..tween(
      'bounce',
      Tween<double>(begin: -500, end: -60),
      begin: const Duration(milliseconds: 0),
      end: const Duration(milliseconds: 700),
    ).thenTween(
      'bounce',
      Tween<double>(begin: -60, end: 0),
      curve: Curves.bounceOut,
      duration: const Duration(milliseconds: 350),
    );

  @override
  Widget build(BuildContext context) => PlayAnimationBuilder(
        tween: dropTween,
        duration: dropTween.duration,
        builder: (context, value, child) => Transform.translate(
          offset: Offset(0, value.get('bounce')),
          child: Container(
            child: child,
          ),
        ),
        child: widget,
      );
}
