import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/simple_animations.dart';

class Particle extends StatelessWidget {
  Particle({
    super.key,
  });

  final tween = MovieTween()
    ..scene(
      duration: const Duration(milliseconds: 600),
    )
        .tween(
          'dx',
          Tween<double>(
            begin: 0,
            end: 100 * Random().nextDouble() * (Random().nextBool() ? 1 : -1),
          ),
        )
        .tween(
          'dy',
          Tween<double>(
            begin: 0,
            end: 100 * Random().nextDouble() * (Random().nextBool() ? 1 : -1),
          ),
        )
        .tween(
          'scale',
          Tween<double>(begin: 1, end: 0),
        );

  @override
  Widget build(BuildContext context) => PlayAnimationBuilder(
        tween: tween,
        duration: tween.duration,
        builder: (context, value, child) => Transform.translate(
          offset: Offset(value.get<double>('dx'), value.get<double>('dy')),
          child: Transform.scale(
            scale: value.get<double>('scale'),
            child: child,
          ),
        ),
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
