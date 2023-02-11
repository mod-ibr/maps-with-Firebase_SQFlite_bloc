import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_googlemaps_bloc/core/utils/assets.dart';
import 'package:flutter_googlemaps_bloc/core/widgets/app_logo_and_name.dart';
import 'package:flutter_googlemaps_bloc/features/auth/presentation/widgets/OTPCode.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/custom_buttom.dart';
import '../../../../core/widgets/custom_text.dart';

class OTPViewBody extends StatelessWidget {
   OTPViewBody({super.key, this.phoneNumber});

  final phoneNumber;
  String smsCode = '';

  verifyOptCode() {
    if (kDebugMode) {
      print(
          '############################### Start Phone Verification  ###############################');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          left: width * 0.03,
          right: width * 0.03,
          bottom: width * 0.03,
        ),
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 35),
              // Logo And app name Section
              AppLogo(width: width),
              const SizedBox(height: 50),
              CustomText(
                text: 'Verify your phone number',
                alignment: Alignment.centerLeft,
                fontFamily: AssetsData.fontFamily,
                color: Constants.mainColor.withOpacity(0.8),
                fontWeight: FontWeight.bold,
                fontSize: 38,
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                child: RichText(
                  text: TextSpan(
                    text: 'Enter the 6-digit code numbers sent to ',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: width * 0.05,
                        height: 1.4),
                    children: <TextSpan>[
                      TextSpan(
                        text: '$phoneNumber',
                        style: const TextStyle(
                          color: Constants.mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 35),
              OTPCode(smsCode: smsCode),
              // pinCodeWidget(context, width, height),
              const SizedBox(height: 35),
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
