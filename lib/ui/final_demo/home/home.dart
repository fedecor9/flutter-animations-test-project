import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/final_demo/card/custom_card.dart';
import 'package:flutter_template/ui/final_demo/home/cubit/home_cubit.dart';
import 'package:flutter_template/ui/final_demo/home/custom_path/path.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_animations/simple_animations.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        lazy: false,
        create: (context) => HomeCubit(),
        child: Container(
          padding: EdgeInsets.only(top: 10.h),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffffffff), Color.fromARGB(255, 255, 225, 235)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              leadingWidth: 50.w,
              backgroundColor: Colors.transparent,
              leading: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: const Icon(
                  Icons.apps_rounded,
                  size: 30,
                  color: Color.fromARGB(205, 218, 178, 191),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: const Icon(
                    Icons.search,
                    size: 35,
                    color: Color.fromARGB(151, 218, 178, 191),
                  ),
                )
              ],
              elevation: 0,
            ),
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeIn(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 23.5.w,
                      vertical: 10.h,
                    ),
                    child: Text(
                      'Discover',
                      style: TextStyle(
                        fontSize: 36.sp,
                        color: const Color.fromARGB(255, 87, 70, 76),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
                const FadeIn(child: _Tabs()),
                SizedBox(height: 15.h),
                Expanded(
                  child: Stack(
                    children: const [
                      _Slider(),
                      _BottomPart(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Positioned(
        bottom: 0,
        child: FadeIn(
          child: CustomPaint(
            painter: RPSCustomPainter(),
            child: SizedBox(
              height: .31.sh,
              width: 1.sw,
              child: Stack(
                children: [
                  Positioned(
                    left: 25,
                    top: 60,
                    child: Text(
                      'Popular Categories',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 87, 70, 76),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 25,
                    top: 65,
                    child: Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(169, 87, 70, 76),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: 35.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CicleOption(
                            color: const Color.fromARGB(180, 149, 125, 173),
                            icon: const FaIcon(
                              FontAwesomeIcons.umbrellaBeach,
                              color: Colors.white,
                            ),
                            text: 'Beach',
                          ),
                          CicleOption(
                            color: const Color(0xFFFFDFD3),
                            icon: const FaIcon(
                              FontAwesomeIcons.car,
                              color: Colors.white,
                            ),
                            text: 'Car',
                            delay: const Duration(milliseconds: 250),
                          ),
                          CicleOption(
                            color: const Color.fromARGB(255, 254, 200, 216),
                            icon: const FaIcon(
                              FontAwesomeIcons.tent,
                              color: Colors.white,
                            ),
                            text: 'Camping',
                            delay: const Duration(milliseconds: 500),
                          ),
                          CicleOption(
                            color: const Color.fromARGB(175, 80, 189, 216),
                            icon: const FaIcon(
                              FontAwesomeIcons.utensils,
                              color: Colors.white,
                            ),
                            text: 'Food',
                            delay: const Duration(milliseconds: 750),
                          ),
                        ],
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

class CicleOption extends StatelessWidget {
  CicleOption({
    required this.icon,
    required this.text,
    required this.color,
    this.delay = const Duration(seconds: 0),
    Key? key,
  }) : super(key: key);
  final Color color;
  final FaIcon icon;
  final String text;
  final Duration delay;
  final tween = MovieTween()
    ..scene(
      curve: Curves.elasticOut,
      begin: const Duration(seconds: 0),
      duration: const Duration(seconds: 1),
    ).tween('scale', Tween<double>(begin: 0, end: 1));
  @override
  Widget build(BuildContext context) => PlayAnimationBuilder(
        delay: delay,
        tween: tween,
        duration: tween.duration,
        builder: (context, value, child) => Transform.scale(
          scale: value.get('scale'),
          child: child,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10.h),
            Container(
              width: 60.w,
              height: 60.h,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: icon,
            ),
            SizedBox(height: 5.h),
            Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(169, 87, 70, 76),
              ),
            ),
          ],
        ),
      );
}

class _Tabs extends StatelessWidget {
  const _Tabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 30.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 9.w,
              ),
              child: InkWell(
                onTap: () {
                  print('Here');
                },
                radius: 20,
                child: Container(
                  margin: EdgeInsets.only(left: 8.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Text(
                    'Best nature',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 87, 70, 76),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print('Here');
              },
              borderRadius: BorderRadius.circular(22),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: Text(
                  'Most viewed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(125, 87, 70, 76),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print('Here');
              },
              radius: 20,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: Text(
                  'Recommended',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(125, 87, 70, 76),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20.h),
          ],
        ),
      );
}

class _Slider extends StatefulWidget {
  const _Slider({
    Key? key,
  }) : super(key: key);

  @override
  State<_Slider> createState() => _SliderState();
}

final placesList = [];

class _SliderState extends State<_Slider> {
  late PageController pageController;

  late ValueNotifier<double> _notifier;
  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.75, initialPage: 0);
    _notifier = ValueNotifier<double>(0);
    pageController.addListener(() {
      _notifier.value = pageController.page ?? 0;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PlayAnimationBuilder(
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
        tween: MovieTween()
          ..scene(duration: const Duration(seconds: 1))
              .tween(
                'opacity',
                Tween<double>(begin: 0, end: 1),
                shiftBegin: const Duration(milliseconds: 500),
              )
              .tween(
                'offset',
                Tween<Offset>(begin: Offset(.8.sw, 0), end: const Offset(0, 0)),
              ),
        builder: (context, animation, child) {
          precacheImage(Image.asset("assets/images/forest.jpg").image, context);
          precacheImage(Image.asset("assets/images/winter.jpg").image, context);
          precacheImage(
            Image.asset("assets/images/waterfall.jpg").image,
            context,
          );
          precacheImage(Image.asset("assets/images/space.jpg").image, context);
          precacheImage(Image.asset("assets/images/river.jpg").image, context);
          return Opacity(
            opacity: animation.get('opacity'),
            child: Transform.translate(
              offset: animation.get('offset'),
              child: child,
            ),
          );
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: PageView.builder(
            controller: pageController,
            itemCount: Places.values.length,
            itemBuilder: (context, index) => AnimatedBuilder(
              animation: _notifier,
              builder: (context, _) => CustomCard(
                description: Places.values[index].description,
                image: Places.values[index].image,
                title: Places.values[index].title,
                onTap: () => context
                    .read<HomeCubit>()
                    .goToImageDetails(Places.values[index]),
                offset: (_notifier.value - index).clamp(-1, 1).toDouble(),
              ),
            ),
          ),
        ),
      );
}

class FadeIn extends StatelessWidget {
  const FadeIn({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) => PlayAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(seconds: 1),
        builder: (context, value, widget) => Opacity(
          opacity: value,
          child: widget,
        ),
        child: child,
      );
}

enum Places {
  forest(
    description: 'Neque porro quisquam est qui dolorem'
        ' ipsum quia dolor sit amet, consectetur...',
    image: 'assets/images/forest.jpg',
    title: 'Forest',
  ),
  waterfall(
    description: 'Neque porro quisquam est qui dolorem'
        ' ipsum quia dolor sit amet, consectetur...',
    image: 'assets/images/waterfall.jpg',
    title: 'Waterfall',
  ),
  space(
    description: 'Neque porro quisquam est qui dolorem'
        ' ipsum quia dolor sit amet, consectetur...',
    image: 'assets/images/space.jpg',
    title: 'Space',
  ),
  winter(
    description: 'Neque porro quisquam est qui dolorem'
        ' ipsum quia dolor sit amet, consectetur...',
    image: 'assets/images/winter.jpg',
    title: 'Winter',
  ),
  lake(
    description: 'Neque porro quisquam est qui dolorem'
        ' ipsum quia dolor sit amet, consectetur...',
    image: 'assets/images/river.jpg',
    title: 'Lake',
  );

  const Places({
    required this.description,
    required this.image,
    required this.title,
  });

  final String description;
  final String image;
  final String title;
}
