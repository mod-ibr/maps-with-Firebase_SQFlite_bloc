import 'package:flutter/material.dart';
import 'package:flutter_googlemaps_bloc/core/utils/assets.dart';
import 'package:flutter_googlemaps_bloc/core/utils/constants.dart';
import 'package:flutter_googlemaps_bloc/core/widgets/custom_text.dart';
import 'package:flutter_googlemaps_bloc/core/widgets/logo_GIF.dart';

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
      children: [
        LogoGIF(),
        const CustomText(
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
