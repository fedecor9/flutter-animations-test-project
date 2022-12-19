// ignore_for_file: lines_longer_than_80_chars

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/final_demo/card/custom_card.dart';
import 'package:flutter_template/ui/final_demo/home/custom_path/path.dart';
import 'package:flutter_template/ui/final_demo/home/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                child: const _Middle(),
              ),
            ),
            const Positioned(
              bottom: 0,
              child: Hero(
                tag: 'bottom',
                child: _Bottom(),
              ),
            ),
          ],
        ),
      );
}

class _Bottom extends StatelessWidget {
  const _Bottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: RPSCustomPainter(),
        child: PlayAnimationBuilder(
          tween: Tween<double>(begin: .64.sh, end: .5.sh),
          duration: const Duration(milliseconds: 500),
          builder: (context, value, child) => SizedBox(
            height: value,
            width: 1.sw,
            child: Material(
              type: MaterialType.transparency,
              child: Stack(
                children: [
                  Positioned(
                    top: 80.h,
                    left: 20.w,
                    child: SizedBox(
                      width: 1.sw,
                      child: FadeIn(
                        child: Row(
                          children: [
                            const Expanded(child: _StackedCircles()),
                            SizedBox(width: 10.w),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Recommended',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: const Color.fromARGB(255, 87, 70, 76),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 60.h,
                    child: FadeIn(
                      child: Container(
                        width: 1.sw,
                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: const Color.fromARGB(255, 87, 70, 76),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing'
                              ' elit. Sed facilisis eros lectus, eleifend '
                              'scelerisque ex fringilla vel. Integer metus lorem, '
                              'finibus sit amet mauris sit amet, convallis '
                              ' tristique molestie a eget metus. Orci varius '
                              'natoque penatibus et magnis.',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: const Color.fromARGB(255, 222, 151, 172),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}

class _StackedCircles extends StatelessWidget {
  const _StackedCircles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        child: Stack(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 25,
            ),
            const Positioned(
              left: 25,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 25,
              ),
            ),
            const Positioned(
              left: 50,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 25,
              ),
            ),
            Positioned(
              left: 75,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 25,
                child: Text(
                  '${Random().nextInt(50)}+',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      );
}

class _Middle extends StatelessWidget {
  const _Middle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: .64.sh,
        width: 1.sw,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 100.h,
              child: SizedBox(
                width: 1.sw,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.solidStar,
                          size: 30,
                          color: Colors.amber,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          Random().nextInt(5).toString(),
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.cloud,
                          size: 30,
                          color: Colors.lightBlue,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '${Random().nextInt(25).toString()}\u2103',
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.clock,
                          size: 30,
                          color: Color.fromARGB(255, 222, 151, 172),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '${Random().nextInt(30).toString()} Days',
                          style: TextStyle(
                            color: const Color.fromARGB(
                              255,
                              222,
                              151,
                              172,
                            ),
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
