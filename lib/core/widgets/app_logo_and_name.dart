import 'package:flutter/material.dart';
import '../utils/assets.dart';
import '../utils/constants.dart';
import 'custom_text.dart';
import 'logo_GIF.dart';

class AppLogo extends StatelessWidget {
/*
App Logo and Name
 */
  const AppLogo({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        LogoGIF(),
        CustomText(
          color: Constants.mainColor,
          text: Constants.appName,
          alignment: Alignment.center,
          fontFamily: AssetsData.fontFamily,
          fontSize: 30,
        ),
      ],
    );
  }
}
