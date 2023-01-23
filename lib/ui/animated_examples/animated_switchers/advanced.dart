/// Inspired by https://github.com/GONZALEZD/flutter_demos/blob/main/flip_animation/lib/main.dart
/// https://medium.com/flutter-community/flutter-flip-card-animation-eb25c403f371

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvancedAnimatedSwitcher extends StatefulWidget {
  const AdvancedAnimatedSwitcher({super.key});

  @override
  State<AdvancedAnimatedSwitcher> createState() =>
      _AdvancedAnimatedSwitcherState();
}

class _AdvancedAnimatedSwitcherState extends State<AdvancedAnimatedSwitcher> {
  late bool _displayFront;
  late bool _flipXAxis;

  @override
  void initState() {
    super.initState();
    _displayFront = true;
    _flipXAxis = true;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Flip Animation'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: RotatedBox(
                quarterTurns: _flipXAxis ? 0 : 1,
                child: const Icon(Icons.flip),
              ),
              onPressed: () => setState(() {
                _flipXAxis = !_flipXAxis;
              }),
            ),
          ],
        ),
        body: Center(
          child: SizedBox(
            width: 200.w,
            height: 200.h,
            child: GestureDetector(
              onTap: () => setState(() => _displayFront = !_displayFront),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                transitionBuilder: __transitionBuilder,
                layoutBuilder: (currentChild, previousChildren) => Stack(
                  children: [
                    currentChild!,
                    ...previousChildren,
                  ],
                ),
                switchInCurve: Curves.easeInBack,
                switchOutCurve: Curves.easeInBack.flipped,
                child: _displayFront ? _buildFront() : _buildRear(),
              ),
            ),
          ),
        ),
      );

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);

    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = ValueKey(_displayFront) != widget!.key;
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: _flipXAxis
              ? (Matrix4.rotationY(value)..setEntry(3, 0, tilt))
              : (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }

  Widget __buildLayout({
    required Key key,
    required String faceName,
    required Color backgroundColor,
  }) =>
      Container(
        key: key,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.0),
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
            faceName.substring(0, 1),
            style: const TextStyle(fontSize: 80.0),
          ),
        ),
      );

  Widget _buildFront() => __buildLayout(
        key: const ValueKey(true),
        backgroundColor: Colors.blue,
        faceName: "F",
      );

  Widget _buildRear() => __buildLayout(
        key: const ValueKey(false),
        backgroundColor: Colors.blue.shade700,
        faceName: "R",
      );
}
