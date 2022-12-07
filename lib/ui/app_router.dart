import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/ui/animated_examples/main_menu/main_animations_menu.dart';
import 'package:flutter_template/ui/animated_examples/particle_effect/particle_effect.dart';
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
        AutoRoute(
          path: AppRouter.animationsMenu,
          page: AnimationsMenu,
          children: [
            AutoRoute(
              path: AppRouter.particlesEffect,
              page: ParticlesCanvas,
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
}
