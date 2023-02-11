import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_googlemaps_bloc/core/utils/constants.dart';
import 'package:flutter_googlemaps_bloc/core/widgets/custom_buttom.dart';
import 'package:flutter_googlemaps_bloc/core/widgets/custom_text.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneAuthView extends StatelessWidget {
   PhoneAuthView({super.key});
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();
  final TextEditingController textEditingController = TextEditingController();
  late final String completePhoneNumber, countryCode, countryISOCode;

// Top Text
  Widget topText(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Add Your Phone Number ',
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
          child: const CustomText(
            text: 'Please enter your phone number to verify your account.',
            color: Colors.black54,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

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

// Verify Button Function
  void verify() {
    if (_phoneFormKey.currentState!.validate()) {
    } else {
      print('########### DATA Failed during verification');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
            left: width * 0.03,
            right: width * 0.03,
            bottom: width * 0.03,
            top: width * 0.2),
        child: Form(
          key: _phoneFormKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                appLogo(width, height),
                SizedBox(height: width * 0.03),
                topText(width, height),
                SizedBox(
                  height: height * 0.05,
                ),
                buildPhoneFormField(width, height),
                SizedBox(
                  height: height * 0.05,
                ),
                CustomButton(
                  onPress: () => verify(),
                  text: 'verify',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
