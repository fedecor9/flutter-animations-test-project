import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimationsScreen extends StatelessWidget {
  const ImplicitAnimationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Implicit animations example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              ShapeShiftingContainer(),
              SizedBox(height: 20),
              FadeInDemo(),
            ],
          ),
        ),
      );
}

class ShapeShiftingContainer extends StatefulWidget {
  const ShapeShiftingContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<ShapeShiftingContainer> createState() => _ShapeShiftingContainerState();
}

class _ShapeShiftingContainerState extends State<ShapeShiftingContainer> {
  final _duration = const Duration(milliseconds: 300);
  double radius = 0;
  double margin = 0;
  Color color = const Color(0xFFFFFFFF);

  double randomBorderRadius() => Random().nextDouble() * 64;

  double randomMargin() => Random().nextDouble() * 10;

  Color randomColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

  void change() {
    setState(() {
      color = randomColor();
      radius = randomBorderRadius();
      margin = randomMargin();
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          AnimatedContainer(
            height: 200,
            width: 200,
            margin: EdgeInsets.all(margin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(randomBorderRadius()),
              color: color,
            ),
            duration: _duration,
          ),
          ElevatedButton(
            child: const Text('change'),
            onPressed: () => change(),
          ),
        ],
      );
}

class FadeInDemo extends StatefulWidget {
  const FadeInDemo({Key? key}) : super(key: key);

  @override
  State<FadeInDemo> createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextButton(
            child: const Text(
              'Show',
              style: TextStyle(color: Colors.blueAccent),
            ),
            onPressed: () => setState(() {
              opacity = 1 - opacity;
            }),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 600),
            opacity: opacity,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blueAccent,
            ),
          ),
        ],
      );
}
