import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.image,
    required this.title,
    required this.offset,
    required this.description,
    this.rounded = true,
    Key? key,
    this.onTap,
  }) : super(key: key);

  final String image;
  final String title;
  final bool rounded;

  final String description;
  final double offset;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: Card(
          elevation: 16,
          shadowColor: const Color.fromARGB(100, 0, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          margin: const EdgeInsets.only(left: 8, right: 8, bottom: 35),
          child: Stack(
            children: [
              GestureDetector(
                onTap: onTap,
                child: _BackgroundImage(
                  image: image,
                  offset: offset,
                  rounded: rounded,
                ),
              ),
              Positioned(
                right: 15,
                top: 15,
                child: Visibility(
                  visible: rounded,
                  child: const Icon(
                    Icons.bookmark,
                    size: 35,
                    color: Color.fromARGB(255, 195, 147, 163),
                  ),
                ),
              ),
              _ImageDescription(
                offset: offset,
                rounded: rounded,
                title: title,
                description: description,
              ),
            ],
          ),
        ),
      );
}

class _ImageDescription extends StatelessWidget {
  const _ImageDescription({
    required this.rounded,
    required this.title,
    required this.description,
    required this.offset,
    Key? key,
  }) : super(key: key);

  final bool rounded;
  final String title;
  final String description;
  final double offset;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: rounded ? 20.w : 28.w,
          vertical: rounded ? 15.h : 80.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '{$title} , {$offset}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    required this.offset,
    required this.image,
    required this.rounded,
    Key? key,
  }) : super(key: key);

  final String image;
  final double offset;
  final bool rounded;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(rounded ? 32 : 0)),
        child: Image.asset(
          image,
          alignment: Alignment(-offset, 0),
          height: rounded
              ? MediaQuery.of(context).size.height * 0.45
              : MediaQuery.of(context).size.height,
          fit: BoxFit.fitHeight,
        ),
      );
}
