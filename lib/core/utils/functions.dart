import 'package:flutter/material.dart';

abstract class AppFunctions {
  static transitionAnymation({required Widget destination, Curve? curve}) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, anotherAnimation) {
          return destination;
        },
        transitionDuration: const Duration(milliseconds: 2000),
        transitionsBuilder: (context, animation, anotherAnimation, child) {
          animation =
              CurvedAnimation(curve: curve ?? Curves.easeIn, parent: animation);
          return Align(
            child: SizeTransition(
              sizeFactor: animation,
              axisAlignment: 0.0,
              child: child,
            ),
          );
        });
  }
}
