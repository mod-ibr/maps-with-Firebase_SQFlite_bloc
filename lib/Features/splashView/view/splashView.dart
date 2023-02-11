import 'package:flutter/material.dart';
import 'package:flutter_googlemaps_bloc/Features/splashView/view/widgets/sliding_text.dart';
import 'package:flutter_googlemaps_bloc/core/services/shared_preferences.dart';
import 'package:flutter_googlemaps_bloc/core/utils/appRouter.dart';
import 'package:flutter_googlemaps_bloc/core/utils/assets.dart';
import 'package:flutter_googlemaps_bloc/core/utils/functions.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    goToNextScreen();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: height * 0.5,
            child: Image.asset(
              AssetsData.logo,
              fit: BoxFit.cover,
            ),
          ),
          SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  void goToNextScreen() {
    Future.delayed(
      const Duration(seconds: 3),
    ).then((value) {
      LocalSharedPreferences.isFirstAppRun(isFirstRun: false);
      Navigator.of(context).pushReplacement(
          AppFunctions.transitionAnymation(destination: AppRouter.logInView));
    });
  }
}
