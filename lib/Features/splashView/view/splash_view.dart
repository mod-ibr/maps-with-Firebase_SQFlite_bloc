import 'package:flutter/material.dart';
import 'package:flutter_googlemaps_bloc/features/splashView/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashViewBody());
  }
}
