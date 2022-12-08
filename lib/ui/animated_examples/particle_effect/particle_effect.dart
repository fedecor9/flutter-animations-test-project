import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/animated_examples/particle_effect/particle/particle.dart';

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
              right: 100.w,
              top: 100.h,
              child: const ParticleTaps(),
            ),
            Positioned(
              top: 170.h,
              child: const ParticleCircleTaps(),
            ),
          ],
        ),
      );
}

class ParticleCircleTaps extends StatefulWidget {
  const ParticleCircleTaps({super.key});

  @override
  State<ParticleCircleTaps> createState() => _ParticleCircleTapsState();
}

class _ParticleCircleTapsState extends State<ParticleCircleTaps> {
  List<Widget> particles = [];

  bool tapVisible = true;

  Duration dur = const Duration(milliseconds: 600);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: .3.sh,
        child: Stack(
          children: [
            GestureDetector(
              onTapDown: (details) {
                _generateParticles(
                  x: details.localPosition.dx,
                  y: details.localPosition.dy,
                );
                // setState(() {
                //   tapVisible = !tapVisible;
                // });
              },
              child: Container(
                height: .4.sh,
                width: 1.sw,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            ...particles
          ],
        ),
      );

  void _removeParticles() {
    setState(() {
      particles = [];
    });
  }

  void _generateParticles({required double x, required double y}) {
    final List<Widget> newParticles = [];
    for (final _ in Iterable.generate(50)) {
      newParticles.add(
        Particle(
          onCompleted: _removeParticles,
          x: x,
          y: y,
        ),
      );
    }
    setState(() {
      particles = [...particles, ...newParticles];
    });
  }
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
                      _generateParticles();
                      setState(() {
                        tapVisible = !tapVisible;
                      });
                      _removeParticles();
                    },
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : Container(),
            ...particles.map((e) => const Particle())
          ],
        ),
      );

  void _removeParticles() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          tapVisible = !tapVisible;
          particles = [];
        });
      },
    );
  }

  void _generateParticles() {
    for (final _ in Iterable.generate(50)) {
      particles.add(
        const Particle(),
      );
    }
  }
}
