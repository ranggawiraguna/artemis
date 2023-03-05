import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';
import 'package:artemis/core/config/theme.dart';

class MessageErrorWidget extends StatelessWidget {
  const MessageErrorWidget(this.error, {Key? key}) : super(key: key);
  final String error;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
      child: Wrap(
        direction: Axis.vertical,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Image.asset("assets/images/icon_error.png"),
          Text(
            "Oops...",
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: Theme.of(context).colorRed),
          ),
          Text(
            error.split('.').first.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(MediaQuery.of(context).size.width - 40, 40),
                ),
              ),
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                } else {
                  context.go('/');
                }
              },
              child: const Text("Close"),
            ),
          ),
        ],
      ),
    );
  }
}
