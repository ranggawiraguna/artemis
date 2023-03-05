import 'dart:math';
import 'package:artemis/features/started/presentation/fragments/onboarding_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnBoardingScreen extends HookWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fragmentData = useState(<OnBoardingLayerData>[
      OnBoardingLayerData(
        color: const Color(0xFFD4E9FF),
        asset: 'assets/image/onboarding_one.png',
        title: lorem(paragraphs: 1, words: 3),
        description: lorem(paragraphs: 1, words: 10),
      ),
      OnBoardingLayerData(
        color: const Color(0xFFE7F3FF),
        asset: 'assets/image/onboarding_two.png',
        title: lorem(paragraphs: 1, words: 3),
        description: lorem(paragraphs: 1, words: 10),
      ),
      OnBoardingLayerData(
        color: const Color(0xFFFFFFFF),
        asset: 'assets/image/onboarding_three.png',
        title: lorem(paragraphs: 1, words: 3),
        description: lorem(paragraphs: 1, words: 10),
      ),
    ]);

    final liquidController = useState(LiquidController());

    final page = useState(0);

    return Stack(
      children: [
        LiquidSwipe.builder(
          itemCount: fragmentData.value.length,
          itemBuilder: (_, __) => OnBoardingLayerFragment(
            fragmentData.value[__],
          ),
          onPageChangeCallback: (_) => page.value = _,
          waveType: WaveType.liquidReveal,
          liquidController: liquidController.value,
          fullTransitionValue: 880,
          enableLoop: false,
          ignoreUserGestureWhileAnimating: true,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  fragmentData.value.length,
                  (_) {
                    double selectedness = Curves.easeOut.transform(
                      max(
                        0.0,
                        1.0 - (page.value - _).abs(),
                      ),
                    );
                    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
                    return SizedBox(
                      width: 25.0,
                      child: Center(
                        child: Material(
                          color: Colors.white,
                          type: MaterialType.circle,
                          child: SizedBox(
                            width: 8.0 * zoom,
                            height: 8.0 * zoom,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        liquidController.value.currentPage < fragmentData.value.length - 1
            ? Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextButton(
                    onPressed: () => liquidController.value.animateToPage(
                      page: fragmentData.value.length - 1,
                      duration: 700,
                    ),
                    child: const Text(
                      "Skip to End",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
        liquidController.value.currentPage < fragmentData.value.length - 1
            ? Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextButton(
                    onPressed: () => liquidController.value.currentPage + 1 <
                            fragmentData.value.length
                        ? liquidController.value.animateToPage(
                            page: liquidController.value.currentPage + 1,
                          )
                        : null,
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
        Positioned(
            bottom: 50,
            left: 50,
            right: 50,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (_, __) => FadeTransition(
                opacity: __,
                child: _,
              ),
              child: liquidController.value.currentPage ==
                      fragmentData.value.length - 1
                  ? SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        key: const ValueKey<bool>(true),
                        onPressed: () => context.go('/home'),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(10)),
                        child: const Text("Mulai Aplikasi"),
                      ),
                    )
                  : const SizedBox.shrink(key: ValueKey<bool>(false)),
            ))
      ],
    );
  }
}
