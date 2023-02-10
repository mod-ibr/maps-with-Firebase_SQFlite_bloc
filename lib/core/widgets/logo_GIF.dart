import 'package:flutter/material.dart';
import 'package:flutter_googlemaps_bloc/core/utils/assets.dart';

class LogoGIF extends StatelessWidget {
  const LogoGIF({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
     return Container(
      width: width * 0.35,
      height: width * 0.35,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: const Image(
        alignment: Alignment.topCenter,
        fit: BoxFit.contain,
        image: AssetImage(
          AssetsData.logo,
        ),
      ),
    );
  }
}
