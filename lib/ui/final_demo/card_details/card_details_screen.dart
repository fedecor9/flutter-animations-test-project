import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/final_demo/card/custom_card.dart';
import 'package:flutter_template/ui/final_demo/home/home.dart';

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
            Transform.scale(
              scale: 1.1,
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
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
      );
}
