import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/ui/animated_examples/main_menu/main_animations_menu.dart';
import 'package:flutter_template/ui/animated_examples/particle_effect/particle_effect.dart';
import 'package:flutter_template/ui/animated_examples/staggered_menu/staggered_menu.dart';
import 'package:flutter_template/ui/animated_examples/staggered_menu/staggered_menu_cubit.dart';
import 'package:flutter_template/ui/common/circle_reveal_clipper.dart';
import 'package:flutter_template/ui/section/section_router.dart';
import 'package:flutter_template/ui/signin/signin_screen.dart';
import 'package:flutter_template/ui/welcome/welcome_screen.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(
      name: 'UnauthenticatedRouter',
      page: SectionRouter,
      initial: true,
      children: [
        AutoRoute(
          path: AppRouter.signInPath,
          page: SignInScreen,
          initial: true,
        ),
      ],
    ),
    AutoRoute(
      name: 'AuthenticatedRouter',
      page: SectionRouter,
      children: [
        AutoRoute(
          path: AppRouter.welcomePath,
          page: WelcomeScreen,
          initial: true,
        ),
        CustomRoute(
          path: 'AnimationsFlow',
          name: 'AnimationsFlowRoute',
          page: EmptyRouterPage,
          transitionsBuilder: customTransition,
          durationInMilliseconds: 2000,
          children: [
            AutoRoute(
              path: AppRouter.particlesEffect,
              page: ParticlesCanvas,
            ),
            CustomRoute(
              transitionsBuilder: customTransition,
              durationInMilliseconds: 1500,
              path: AppRouter.animationsMenu,
              page: AnimationsMenu,
              initial: true,
            ),
            AutoRoute(
              path: AppRouter.staggeredMenu,
              page: StaggeredMenu,
            ),
          ],
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  static const signInPath = 'signin';
  static const animationsMenu = 'animations_menu';
  static const welcomePath = 'welcome';
  static const particlesEffect = 'particlesEffect';
  static const staggeredMenu = 'staggeredMenu';
}

Widget customTransition(
  BuildContext context,
  Animation<double> firstAnimation,
  Animation secondAnimation,
  Widget child,
) {
  final screenSize = MediaQuery.of(context).size;
  final center = Offset(screenSize.width, screenSize.height / 2);
  const beginRadius = 0.0;
  final endRadius = screenSize.height * 1.2;

  final tween = Tween<double>(begin: beginRadius, end: endRadius);
  final radiusTweenAnimation = firstAnimation.drive(tween);
  return ClipPath(
    clipper:
        CircleRevealClipper(center: center, radius: radiusTweenAnimation.value),
    child: child,
  );
}
