import 'package:flutter/material.dart';

class DropAnimatedContainer extends StatefulWidget {
  final Widget child;
  const DropAnimatedContainer({
    required this.child,
    super.key,
  });

  @override
  State<DropAnimatedContainer> createState() => _DropAnimatedContainerState();
}

class _DropAnimatedContainerState extends State<DropAnimatedContainer>
    with SingleTickerProviderStateMixin {
  late final Animation dropAnimation;
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    dropAnimation = Tween<double>(begin: -300, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.bounceOut,
      ),
    );

    controller
      ..forward()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Transform.translate(
        offset: Offset(0, dropAnimation.value),
        child: Container(
          child: widget.child,
        ),
      );
}
