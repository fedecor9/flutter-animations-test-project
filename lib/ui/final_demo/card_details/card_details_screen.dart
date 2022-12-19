import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/final_demo/card/custom_card.dart';
import 'package:flutter_template/ui/final_demo/home/custom_path/path.dart';
import 'package:flutter_template/ui/final_demo/home/home.dart';
import 'package:simple_animations/simple_animations.dart';

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({
    required this.place,
    super.key,
  });
  final Places place;
  @override
  Widget build(BuildContext context) => Material(
        child: Stack(
          children: [
            Hero(
              tag: place.title,
              child: Transform.scale(
                scale: 1.12,
                child: SizedBox(
                  height: .55.sh,
                  child: CustomCard(
                    image: place.image,
                    title: place.title,
                    offset: 0,
                    rounded: false,
                    description: place.description,
                  ),
                ),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
            ),
            Positioned(
              bottom: 0,
              child: CustomPaint(
                painter: RPSCustomPainter(
                  color: const Color.fromARGB(255, 255, 239, 244),
                ),
                child: SizedBox(
                  height: .64.sh,
                  width: 1.sw,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Hero(
                tag: 'bottom',
                child: CustomPaint(
                  painter: RPSCustomPainter(),
                  child: PlayAnimationBuilder(
                    tween: Tween<double>(begin: .64.sh, end: .5.sh),
                    duration: const Duration(milliseconds: 500),
                    builder: (context, value, child) => SizedBox(
                      height: value,
                      width: 1.sw,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
