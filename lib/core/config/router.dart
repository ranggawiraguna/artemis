import "package:artemis/features/home/presentation/screens/home.dart";
import "package:artemis/features/started/presentation/screens/splash.dart";
import "package:artemis/features/started/presentation/screens/onboarding.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class AppRoutes {
  static final paths = {
    "splash": "/",
    "onboarding": "/onboarding",
    "home": "/home",
  };

  static final GoRouter routers = GoRouter(
    initialLocation: "/",
    errorBuilder: (context, state) => Container(),
    errorPageBuilder: (context, state) {
      return FadeTransitionPage(
        child: Container(),
        key: state.pageKey,
      );
    },
    routes: <GoRoute>[
      GoRoute(
          path: paths["splash"].toString(),
          pageBuilder: (BuildContext context, GoRouterState state) =>
              FadeTransitionPage(
                child: const SplashScreen(),
                key: state.pageKey,
              )),
      GoRoute(
          path: paths["onboarding"].toString(),
          pageBuilder: (BuildContext context, GoRouterState state) =>
              FadeTransitionPage(
                child: const OnBoardingScreen(),
                key: state.pageKey,
              )),
      GoRoute(
          path: paths["home"].toString(),
          pageBuilder: (BuildContext context, GoRouterState state) =>
              FadeTransitionPage(
                child: const HomeScreen(),
                key: state.pageKey,
              )),
    ],
  );
}

class FadeTransitionPage extends CustomTransitionPage<void> {
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
          key: key,
          transitionsBuilder: (c, animation, a2, child) => FadeTransition(
            opacity: animation.drive(_curveTween),
            child: child,
          ),
          child: child,
        );

  static final _curveTween = CurveTween(curve: Curves.easeIn);
}
