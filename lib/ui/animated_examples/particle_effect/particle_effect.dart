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
                      _generateParticles();
                      setState(() {
                        tapVisible = !tapVisible;
                      });
                      _removeParticles();
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
            ...particles.map((e) => Particle())
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
        Particle(),
      );
    }
  }
}
