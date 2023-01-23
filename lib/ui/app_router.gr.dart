// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    UnauthenticatedRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SectionRouter(),
      );
    },
    AuthenticatedRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SectionRouter(),
      );
    },
    SignInScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    WelcomeScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const WelcomeScreen(),
      );
    },
    DemoFlow.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const HeroEmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    AnimationsFlowRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
        transitionsBuilder: customTransition,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const Home(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CardDetailsScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CardDetailsScreenRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: CardDetailsScreen(
          place: args.place,
          key: args.key,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ParticlesCanvasRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ParticlesCanvas(),
      );
    },
    AnimationsMenuRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const AnimationsMenu(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    StaggeredMenuRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const StaggeredMenu(),
      );
    },
    ImplicitAnimationsScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ImplicitAnimationsScreen(),
      );
    },
    AnimatedSwitcherFlowRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    AnimatedSwitcherMenuRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AnimatedSwitcherMenu(),
      );
    },
    AdvancedAnimatedSwitcherRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AdvancedAnimatedSwitcher(),
      );
    },
    BasicAnimatedSwitcherRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const BasicAnimatedSwitcher(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          UnauthenticatedRouter.name,
          path: '/',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: UnauthenticatedRouter.name,
              redirectTo: 'signin',
              fullMatch: true,
            ),
            RouteConfig(
              SignInScreenRoute.name,
              path: 'signin',
              parent: UnauthenticatedRouter.name,
            ),
          ],
        ),
        RouteConfig(
          AuthenticatedRouter.name,
          path: '/section-router',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: AuthenticatedRouter.name,
              redirectTo: 'welcome',
              fullMatch: true,
            ),
            RouteConfig(
              WelcomeScreenRoute.name,
              path: 'welcome',
              parent: AuthenticatedRouter.name,
            ),
            RouteConfig(
              DemoFlow.name,
              path: 'finalDemoFlow',
              parent: AuthenticatedRouter.name,
              children: [
                RouteConfig(
                  '#redirect',
                  path: '',
                  parent: DemoFlow.name,
                  redirectTo: 'demoHome',
                  fullMatch: true,
                ),
                RouteConfig(
                  HomeRoute.name,
                  path: 'demoHome',
                  parent: DemoFlow.name,
                ),
                RouteConfig(
                  CardDetailsScreenRoute.name,
                  path: 'demoCardDetails',
                  parent: DemoFlow.name,
                ),
              ],
            ),
            RouteConfig(
              AnimationsFlowRoute.name,
              path: 'AnimationsFlow',
              parent: AuthenticatedRouter.name,
              children: [
                RouteConfig(
                  '#redirect',
                  path: '',
                  parent: AnimationsFlowRoute.name,
                  redirectTo: 'animations_menu',
                  fullMatch: true,
                ),
                RouteConfig(
                  ParticlesCanvasRoute.name,
                  path: 'particlesEffect',
                  parent: AnimationsFlowRoute.name,
                ),
                RouteConfig(
                  AnimationsMenuRoute.name,
                  path: 'animations_menu',
                  parent: AnimationsFlowRoute.name,
                ),
                RouteConfig(
                  StaggeredMenuRoute.name,
                  path: 'staggeredMenu',
                  parent: AnimationsFlowRoute.name,
                ),
                RouteConfig(
                  ImplicitAnimationsScreenRoute.name,
                  path: 'implicitAnimatons',
                  parent: AnimationsFlowRoute.name,
                ),
                RouteConfig(
                  AnimatedSwitcherFlowRoute.name,
                  path: 'AnimatedSwitcherFlow',
                  parent: AnimationsFlowRoute.name,
                  children: [
                    RouteConfig(
                      '#redirect',
                      path: '',
                      parent: AnimatedSwitcherFlowRoute.name,
                      redirectTo: 'animatedSwitcherDemo',
                      fullMatch: true,
                    ),
                    RouteConfig(
                      AnimatedSwitcherMenuRoute.name,
                      path: 'animatedSwitcherDemo',
                      parent: AnimatedSwitcherFlowRoute.name,
                    ),
                    RouteConfig(
                      AdvancedAnimatedSwitcherRoute.name,
                      path: 'advancedAnimatedSwitcher',
                      parent: AnimatedSwitcherFlowRoute.name,
                    ),
                    RouteConfig(
                      BasicAnimatedSwitcherRoute.name,
                      path: 'basicAnimatedSwitcher',
                      parent: AnimatedSwitcherFlowRoute.name,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [SectionRouter]
class UnauthenticatedRouter extends PageRouteInfo<void> {
  const UnauthenticatedRouter({List<PageRouteInfo>? children})
      : super(
          UnauthenticatedRouter.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'UnauthenticatedRouter';
}

/// generated route for
/// [SectionRouter]
class AuthenticatedRouter extends PageRouteInfo<void> {
  const AuthenticatedRouter({List<PageRouteInfo>? children})
      : super(
          AuthenticatedRouter.name,
          path: '/section-router',
          initialChildren: children,
        );

  static const String name = 'AuthenticatedRouter';
}

/// generated route for
/// [SignInScreen]
class SignInScreenRoute extends PageRouteInfo<void> {
  const SignInScreenRoute()
      : super(
          SignInScreenRoute.name,
          path: 'signin',
        );

  static const String name = 'SignInScreenRoute';
}

/// generated route for
/// [WelcomeScreen]
class WelcomeScreenRoute extends PageRouteInfo<void> {
  const WelcomeScreenRoute()
      : super(
          WelcomeScreenRoute.name,
          path: 'welcome',
        );

  static const String name = 'WelcomeScreenRoute';
}

/// generated route for
/// [HeroEmptyRouterPage]
class DemoFlow extends PageRouteInfo<void> {
  const DemoFlow({List<PageRouteInfo>? children})
      : super(
          DemoFlow.name,
          path: 'finalDemoFlow',
          initialChildren: children,
        );

  static const String name = 'DemoFlow';
}

/// generated route for
/// [EmptyRouterPage]
class AnimationsFlowRoute extends PageRouteInfo<void> {
  const AnimationsFlowRoute({List<PageRouteInfo>? children})
      : super(
          AnimationsFlowRoute.name,
          path: 'AnimationsFlow',
          initialChildren: children,
        );

  static const String name = 'AnimationsFlowRoute';
}

/// generated route for
/// [Home]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'demoHome',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [CardDetailsScreen]
class CardDetailsScreenRoute extends PageRouteInfo<CardDetailsScreenRouteArgs> {
  CardDetailsScreenRoute({
    required Places place,
    Key? key,
  }) : super(
          CardDetailsScreenRoute.name,
          path: 'demoCardDetails',
          args: CardDetailsScreenRouteArgs(
            place: place,
            key: key,
          ),
        );

  static const String name = 'CardDetailsScreenRoute';
}

class CardDetailsScreenRouteArgs {
  const CardDetailsScreenRouteArgs({
    required this.place,
    this.key,
  });

  final Places place;

  final Key? key;

  @override
  String toString() {
    return 'CardDetailsScreenRouteArgs{place: $place, key: $key}';
  }
}

/// generated route for
/// [ParticlesCanvas]
class ParticlesCanvasRoute extends PageRouteInfo<void> {
  const ParticlesCanvasRoute()
      : super(
          ParticlesCanvasRoute.name,
          path: 'particlesEffect',
        );

  static const String name = 'ParticlesCanvasRoute';
}

/// generated route for
/// [AnimationsMenu]
class AnimationsMenuRoute extends PageRouteInfo<void> {
  const AnimationsMenuRoute()
      : super(
          AnimationsMenuRoute.name,
          path: 'animations_menu',
        );

  static const String name = 'AnimationsMenuRoute';
}

/// generated route for
/// [StaggeredMenu]
class StaggeredMenuRoute extends PageRouteInfo<void> {
  const StaggeredMenuRoute()
      : super(
          StaggeredMenuRoute.name,
          path: 'staggeredMenu',
        );

  static const String name = 'StaggeredMenuRoute';
}

/// generated route for
/// [ImplicitAnimationsScreen]
class ImplicitAnimationsScreenRoute extends PageRouteInfo<void> {
  const ImplicitAnimationsScreenRoute()
      : super(
          ImplicitAnimationsScreenRoute.name,
          path: 'implicitAnimatons',
        );

  static const String name = 'ImplicitAnimationsScreenRoute';
}

/// generated route for
/// [EmptyRouterPage]
class AnimatedSwitcherFlowRoute extends PageRouteInfo<void> {
  const AnimatedSwitcherFlowRoute({List<PageRouteInfo>? children})
      : super(
          AnimatedSwitcherFlowRoute.name,
          path: 'AnimatedSwitcherFlow',
          initialChildren: children,
        );

  static const String name = 'AnimatedSwitcherFlowRoute';
}

/// generated route for
/// [AnimatedSwitcherMenu]
class AnimatedSwitcherMenuRoute extends PageRouteInfo<void> {
  const AnimatedSwitcherMenuRoute()
      : super(
          AnimatedSwitcherMenuRoute.name,
          path: 'animatedSwitcherDemo',
        );

  static const String name = 'AnimatedSwitcherMenuRoute';
}

/// generated route for
/// [AdvancedAnimatedSwitcher]
class AdvancedAnimatedSwitcherRoute extends PageRouteInfo<void> {
  const AdvancedAnimatedSwitcherRoute()
      : super(
          AdvancedAnimatedSwitcherRoute.name,
          path: 'advancedAnimatedSwitcher',
        );

  static const String name = 'AdvancedAnimatedSwitcherRoute';
}

/// generated route for
/// [BasicAnimatedSwitcher]
class BasicAnimatedSwitcherRoute extends PageRouteInfo<void> {
  const BasicAnimatedSwitcherRoute()
      : super(
          BasicAnimatedSwitcherRoute.name,
          path: 'basicAnimatedSwitcher',
        );

  static const String name = 'BasicAnimatedSwitcherRoute';
}
