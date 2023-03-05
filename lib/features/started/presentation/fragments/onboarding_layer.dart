import 'package:artemis/core/service/utilities.dart';
import 'package:flutter/material.dart';

class OnBoardingLayerFragment extends StatelessWidget {
  final OnBoardingLayerData data;

  const OnBoardingLayerFragment(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: utils.getFullHeight(context) + MediaQuery.of(context).padding.top,
      color: data.color,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                data.asset,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 20),
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18,
                ),
          ),
          const SizedBox(height: 150),
        ],
      ),
    );
  }
}

class OnBoardingLayerData {
  final Color color;
  final String asset, title, description;

  OnBoardingLayerData({
    required this.color,
    required this.asset,
    required this.title,
    required this.description,
  });
}
