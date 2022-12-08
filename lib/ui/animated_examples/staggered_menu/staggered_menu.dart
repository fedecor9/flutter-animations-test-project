import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/common/staggered_animation.dart';

class StaggeredMenu extends StatelessWidget {
  const StaggeredMenu({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Staggered animations')),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: 4 * 8,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(5.0.sp),
              child: CustomStaggeredAnimation(
                delay: Duration(
                  milliseconds: sqrt(
                        pow((index / 4).ceil(), 2) + pow((index % 4).ceil(), 2),
                      ).toInt() *
                      250,
                ),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      index.toString(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
