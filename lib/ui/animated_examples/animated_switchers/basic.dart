import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicAnimatedSwitcher extends StatefulWidget {
  const BasicAnimatedSwitcher({super.key});

  @override
  State<BasicAnimatedSwitcher> createState() => _BasicAnimatedSwitcherState();
}

class _BasicAnimatedSwitcherState extends State<BasicAnimatedSwitcher> {
  final Duration _duration = const Duration(milliseconds: 500);
  bool flag = true;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Basic animated switcher'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          onPressed: () => setState(() {
            flag = !flag;
          }),
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
        ),
        body: Center(
          child: AnimatedSwitcher(
            duration: _duration,
            child: flag
                ? Container(
                    //The key is necesary for the animation to work
                    key: UniqueKey(),
                    color: Colors.amber,
                    width: 200.w,
                    height: 200.h,
                  )
                : Container(
                    key: UniqueKey(),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.redAccent,
                    ),
                    width: 200.w,
                    height: 200.h,
                  ),
          ),
        ),
      );
}
