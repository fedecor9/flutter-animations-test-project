import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/model/project.dart';
import 'package:flutter_template/ui/common/slide_in_animation.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/section/error_handler/error_handler_cubit.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';
import 'package:flutter_template/ui/welcome/project_card.dart';
import 'package:flutter_template/ui/welcome/welcome_cubit.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => WelcomeCubit(context.read<ErrorHandlerCubit>()),
        child: _WelcomeContentScreen(),
      );
}

class _WelcomeContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<WelcomeCubit, WelcomeBaseState>(
        builder: (context, state) => Scaffold(
          backgroundColor: const Color.fromARGB(255, 149, 216, 245),
          body: Stack(
            children: [
              const _Drawer(),
              MyWidget(projects: state.projects),
            ],
          ),
        ),
      );
}

class _Drawer extends StatelessWidget {
  const _Drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned(
            left: -40.w,
            child: Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Image.asset(
                'assets/splash_branding.png',
                width: .7.sw,
                fit: BoxFit.contain,
                color: context.theme.colors.primary,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: .22.sh,
                width: double.infinity,
              ),
              Container(
                margin: EdgeInsets.only(left: 23.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: context.read<WelcomeCubit>().logOut,
                      child: Text(
                        'Log out',
                        style: context.theme.textStyles.headline4,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    TextButton(
                      onPressed: context.read<WelcomeCubit>().goToAnimations,
                      child: Text(
                        'Animations',
                        style: context.theme.textStyles.headline4,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    TextButton(
                      onPressed: context.read<WelcomeCubit>().goToDemo,
                      child: Text(
                        'Demo',
                        style: context.theme.textStyles.headline4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
}

class _ProjectListContent extends StatelessWidget {
  final List<Project> projects;
  final void Function() toggle;

  const _ProjectListContent({
    required this.projects,
    required this.toggle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 100.h,
              title: Text(
                context.localizations.xmartlabs_projects,
                style: context.theme.textStyles.bodyLarge!
                    .copyWith(color: Colors.white),
              ),
              leading: IconButton(
                onPressed: () {
                  toggle();
                },
                icon: const Icon(Icons.menu),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 200.h,
              delegate: SliverChildBuilderDelegate(
                (context, index) => SlideInAnimation(
                  myChild: ProjectWidget(
                    project: projects[index],
                  ),
                ),
                childCount: projects.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: const Text('Made with ❤️ by Xmartlabs'),
              ),
            ),
          ],
        ),
      );
}

class MyWidget extends StatefulWidget {
  final List<Project> projects;
  const MyWidget({
    required this.projects,
    super.key,
  });

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  var isOpen = false;
  bool _canBeDragged = true;
  final duration = const Duration(milliseconds: 200);
  //Drag animation -> Custom animations
  void toogle() {
    controller.isDismissed ? controller.forward() : controller.reverse();
  }

  void _onDragStart(DragStartDetails details) {
    final bool isDragOpen =
        controller.isDismissed && details.globalPosition.dx < 500;
    final bool isDragClose =
        controller.isCompleted && details.globalPosition.dx > 150;
    _canBeDragged = isDragOpen || isDragClose;
  }

  void _onDragEnd(DragEndDetails details) {
    if (controller.isDismissed || controller.isCompleted) return;
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      final visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      controller.fling(velocity: visualVelocity);
    } else {
      controller.value < .5 ? controller.reverse() : controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: duration);
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          final dx = controller.value * 100;
          final scale = 1 - (controller.value * .3);
          return GestureDetector(
            onHorizontalDragUpdate: _onDragUpdate,
            onHorizontalDragEnd: _onDragEnd,
            onHorizontalDragStart: _onDragStart,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(dx)
                ..scale(scale),
              alignment: Alignment.centerRight,
              child: child,
            ),
          );
        },
        child: _ProjectListContent(
          projects: widget.projects,
          toggle: toogle,
        ),
      );

  void _onDragUpdate(details) {
    if (_canBeDragged) {
      final delta = details.primaryDelta! / 250;
      controller.value += delta;
    }
  }
}
