import 'package:artemis/core/service/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 2), () {
        context.go('/onboarding');
      });

      return null;
    }, []);

    return Scaffold(
      backgroundColor: const Color(0xFFD4E9FF),
      body: Center(
        child: FlutterLogo(
          size: utils.getSizeConstraint(context, 650),
          style: FlutterLogoStyle.horizontal,
        ),
      ),
    );
  }
}
