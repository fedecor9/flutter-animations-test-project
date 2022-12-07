import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/simple_animations.dart';

class ParticlesCanvas extends StatelessWidget {
  const ParticlesCanvas({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Animations menu'),
        ),
        body: Stack(
          children: [
            Positioned(
              left: 20.w,
              top: 50.h,
              child: const ParticleTaps(),
            ),
            Positioned(
              right: 50.w,
              top: 120.h,
              child: const ParticleTaps(),
            ),
          ],
        ),
      );
}

class ParticleTaps extends StatefulWidget {
  const ParticleTaps({super.key});

  @override
  State<ParticleTaps> createState() => _ParticleTapsState();
}

class _ParticleTapsState extends State<ParticleTaps> {
  List<Widget> particles = [];

  bool tapVisible = true;

  @override
  Widget build(BuildContext context) => SizedBox(
        child: Stack(
          children: [
            tapVisible
                ? GestureDetector(
                    onTapDown: (details) {
                      Iterable.generate(50).forEach((_) {
                        particles.add(
                          Particle(),
                        );
                      });
                      setState(() {
                        tapVisible = !tapVisible;
                      });

                      Future.delayed(
                        const Duration(seconds: 4),
                        () {
                          setState(() {
                            tapVisible = !tapVisible;
                            particles = [];
                          });
                        },
                      );
                    },
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(80),
                      ),
                    ),
                  )
                : Container(),
            ...particles
          ],
        ),
      );
}

class Particle extends StatelessWidget {
  Particle({
    super.key,
  });

  final tween = MovieTween()
    ..scene(
      duration: const Duration(milliseconds: 700),
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
