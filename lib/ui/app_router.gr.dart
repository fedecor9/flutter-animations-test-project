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
    AnimationsFlowRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
        transitionsBuilder: customTransition,
        durationInMilliseconds: 2000,
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
        transitionsBuilder: customTransition,
        durationInMilliseconds: 1500,
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
