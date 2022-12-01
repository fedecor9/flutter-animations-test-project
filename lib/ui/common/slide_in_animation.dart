import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlideInAnimation extends StatefulWidget {
  final Widget myChild;
  const SlideInAnimation({
    required this.myChild,
    Key? key,
  }) : super(key: key);

  @override
  State<SlideInAnimation> createState() => SlideInAnimationState();
}

class SlideInAnimationState extends State<SlideInAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation slideAnimation;
  late final Animation opacity;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slideAnimation =
        Tween<Offset>(begin: Offset(400.w, 0), end: const Offset(0, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.elasticOut,
      ),
    );

    opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, .5),
      ),
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: animationController,
        builder: (_, child) => Transform.translate(
          offset: slideAnimation.value,
          child: Opacity(
            opacity: opacity.value,
            child: child,
          ),
        ),
        child: widget.myChild,
      );
}
