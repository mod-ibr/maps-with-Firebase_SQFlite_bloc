import 'package:flutter/material.dart';
import '../../../core/utils/app_router.dart';
import '../widgets/sliding_text.dart';
import '../../../core/services/shared_preferences.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/functions.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
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
    return Column(
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
