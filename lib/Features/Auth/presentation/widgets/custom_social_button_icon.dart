import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text.dart';

class CustomSocialButtonIcon extends StatelessWidget {
  final String? imageName;
  final IconData? iconData;
  final Function onPress;
  final Color backGroundColor;

  const CustomSocialButtonIcon({
    super.key,
    this.imageName,
    this.iconData,
    required this.onPress,
    this.backGroundColor = const Color.fromARGB(177, 250, 250, 250),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: backGroundColor,
      ),
      child: MaterialButton(
        onPressed: () => onPress(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.0),
        ),
        color: backGroundColor,
        child: (imageName != null)
            ? Image.asset(
                imageName!,
                fit: BoxFit.cover,
              )
            : Icon(iconData),
      ),
    );
  }
}
