import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_googlemaps_bloc/core/utils/constants.dart';
import 'package:flutter_googlemaps_bloc/core/widgets/custom_buttom.dart';
import 'package:flutter_googlemaps_bloc/core/widgets/custom_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPview extends StatelessWidget {
   OTPview({super.key, required this.phoneNumber});
  final phoneNumber;

    late String smsCode;

// App Logo
  Widget appLogo(double width, double height) {
    return ClipOval(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: width * 0.6,
        height: width * 0.6,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: const Image(
          alignment: Alignment.center,
          fit: BoxFit.contain,
          image: AssetImage(
            'assets/images/01logo.png',
          ),
        ),
      ),
    );
  }

// Top Text
  Widget topText(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Verify your phone number',
          color: Constants.mainColor,
          alignment: Alignment.center,
          fontSize: width * 0.09,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: height * 0.05,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: RichText(
            text: TextSpan(
              text: 'Enter the 6-digit code numbers sent to ',
              style: TextStyle(
                  color: Colors.amber[900]!.withOpacity(0.8),
                  fontSize: width * 0.05,
                  height: 1.4),
              children: <TextSpan>[
                TextSpan(
                  text: '$phoneNumber',
                  style: const TextStyle(color: Constants.mainColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

// Pin Code Widget
  Widget pinCodeWidget(BuildContext context, double width, double height) {
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
          print("Completed");
        }
      },
      onChanged: (value) {
        if (kDebugMode) {
          print(value);
        }
      },
    );
  }

  verifyOptCode() {
    if (kDebugMode) {
      print(
        '############################### Start Phone Auth ###############################');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(
            left: width * 0.03,
            right: width * 0.03,
            bottom: width * 0.03,
            top: width * 0.07),
        child: SingleChildScrollView(
          child: Column(
            children: [
              appLogo(width, height),
              SizedBox(height: width * 0.03),
              topText(width, height),
              SizedBox(height: width * 0.08),
              pinCodeWidget(context, width, height),
              SizedBox(height: width * 0.18),
              CustomButton(
                onPress: () => verifyOptCode(),
                text: 'verify',
              )
            ],
          ),
        ),
      ),
    );
  }
}
