import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/simple_animations.dart';

class Particle extends StatelessWidget {
  const Particle({
    this.x = 0,
    this.y = 0,
    this.onCompleted,
    super.key,
  });
  final double x;
  final double y;
  final void Function()? onCompleted;

  //This needs to be a method to access the x and y parameters
  MovieTween _createTween() => MovieTween()
    ..scene(
      duration: const Duration(milliseconds: 600),
    )
        .tween(
          'dx',
          Tween<double>(
            begin: x != 0 ? (x - 25) : x,
            end: x +
                200 * Random().nextDouble() * (Random().nextBool() ? 1 : -1),
          ),
        )
        .tween(
          'dy',
          Tween<double>(
            begin: y != 0 ? (y - 25) : y,
            end: y +
                200 * Random().nextDouble() * (Random().nextBool() ? 1 : -1),
          ),
        )
        .tween(
          'scale',
          Tween<double>(begin: 1, end: 0),
        );

  @override
  Widget build(BuildContext context) => PlayAnimationBuilder(
        tween: _createTween(),
        duration: const Duration(milliseconds: 600),
        builder: (context, value, child) => Transform.translate(
          offset: Offset(value.get<double>('dx'), value.get<double>('dy')),
          child: Transform.scale(
            scale: value.get<double>('scale'),
            child: child,
          ),
        ),
        onCompleted: onCompleted,
        child: Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      );
}
