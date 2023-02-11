import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_googlemaps_bloc/core/utils/appRouter.dart';
import 'package:flutter_googlemaps_bloc/core/utils/assets.dart';
import 'package:flutter_googlemaps_bloc/core/utils/constants.dart';
import 'package:flutter_googlemaps_bloc/core/utils/functions.dart';
import 'package:flutter_googlemaps_bloc/core/widgets/app_logo_and_name.dart';
import 'package:flutter_googlemaps_bloc/core/widgets/custom_buttom.dart';
import 'package:flutter_googlemaps_bloc/core/widgets/custom_text.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneAuthViewBody extends StatelessWidget {
  PhoneAuthViewBody({super.key});
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();
  final TextEditingController textEditingController = TextEditingController();
  late final String completePhoneNumber, countryCode, countryISOCode;

// Phone TextField
  Widget buildPhoneFormField(double width, double height) {
    return IntlPhoneField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: 'Phone Number',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber[900]!),
        ),
      ),
      style: TextStyle(letterSpacing: 3, fontSize: width * 0.04512),
      initialCountryCode: 'EG',
      autofocus: true,
      autovalidateMode: AutovalidateMode.disabled,
      cursorColor: Constants.mainColor,
      onChanged: (phone) {
        completePhoneNumber = phone.completeNumber;
        countryCode = phone.countryCode;
        countryISOCode = phone.countryISOCode;
        if (kDebugMode) {
          print('########################');
          print(phone.completeNumber); //get complete number
          print(phone.countryCode); // get country code only
          print(phone.countryISOCode); // get country code only
          print(phone.number); // only phone number
        }
      },
    );
  }

// Verify Button Function
  void verify() {
    if (_phoneFormKey.currentState!.validate()) {
      if (kDebugMode) {
        print('Valiation Done : Go to OTP  Page');
      }
    } else {
      if (kDebugMode) {
        print('########### DATA Failed during verification');
      }
    }
  }

  // Navigation to Sign Up View
  void goToRegisterView(context) {
    Navigator.of(context).push(
        AppFunctions.transitionAnymation(destination: AppRouter.phoneAuthView));
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
        ),
        width: width,
        height: height,
        child: ListView(
          children: [
            // Logo And app name Section
            AppLogo(width: width),
            const SizedBox(height: 70),
            // Phone Auth Section
            Form(
              key: _phoneFormKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Log in with Your Phone Number ',
                      alignment: Alignment.centerLeft,
                      fontFamily: AssetsData.fontFamily,
                      color: Constants.mainColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                    const SizedBox(height: 40),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: const CustomText(
                        text: 'Please enter your phone number ',
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: const CustomText(
                        text: 'without country code.',
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    buildPhoneFormField(width, height),
                    const SizedBox(height: 55),
                    CustomButton(
                      onPress: () => verify(),
                      text: 'Verify',
                    ),
                    const SizedBox(height: 40),

                    //  Log in Route
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(
                          text: 'have an account, ',
                          alignment: Alignment.center,
                          fontFamily: AssetsData.fontFamily,
                          fontSize: 13,
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            if (kDebugMode) {
                              print('Go To Log In Page ');
                            }
                            AppFunctions.goToRoute(
                                AppRouter.logInView, context);
                          },
                          child: const CustomText(
                            text: 'Log in here',
                            color: Constants.mainColor,
                            alignment: Alignment.center,
                            fontFamily: AssetsData.fontFamily,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
