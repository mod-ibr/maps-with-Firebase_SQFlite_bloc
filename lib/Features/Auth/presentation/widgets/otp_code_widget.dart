import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_googlemaps_bloc/core/utils/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPCodeWidget extends StatelessWidget {
  const OTPCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    late String smsCode;
    double width = MediaQuery.of(context).size.width;
    return PinCodeTextField(
      appContext: context,
      autoFocus: true,
      cursorColor: Constants.mainColor,
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.circle,
        fieldHeight: width * 0.13,
        fieldWidth: width * 0.13,
        borderWidth: 1.5,
        activeColor: Constants.mainColor,
        inactiveColor: Constants.mainColor.withOpacity(0.5),
        inactiveFillColor: Colors.white,
        activeFillColor: Constants.mainColor.withOpacity(0.3),
        selectedColor: Constants.mainColor,
        selectedFillColor: Colors.white24,
      ),
      animationDuration: const Duration(milliseconds: 500),
      backgroundColor: Colors.white24,
      enableActiveFill: true,
      onCompleted: (submitedCode) {
        smsCode = submitedCode;
        if (kDebugMode) {
          print("Completed OTP Code : $submitedCode");
        }
      },
      onChanged: (value) {
        if (kDebugMode) {
          print('Code : $value');
        }
      },
    );
  }
}
