import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Text(
              style: TextStyle(fontSize: 45, color: Constants.mainColor),
              textAlign: TextAlign.center,
              Constants.appName,
            ),
          );
        });
  }
}
