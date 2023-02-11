import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_googlemaps_bloc/Features/Auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter_googlemaps_bloc/core/utils/appRouter.dart';
import 'package:flutter_googlemaps_bloc/core/utils/assets.dart';
import 'package:flutter_googlemaps_bloc/core/utils/constants.dart';
import 'package:flutter_googlemaps_bloc/core/utils/functions.dart';
import 'package:flutter_googlemaps_bloc/core/widgets/app_logo_and_name.dart';
import 'package:flutter_googlemaps_bloc/core/widgets/custom_buttom.dart';
import 'package:flutter_googlemaps_bloc/core/widgets/custom_text.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // Navigation to Sign Up View
    void goToRegisterView() {
      Navigator.of(context).pushReplacement(
          AppFunctions.transitionAnymation(destination: AppRouter.logInView));
    }

    return Container(
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
            const SizedBox(height: 30),
            // Create Account Section
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomText(
                    text: 'Create new account ',
                    alignment: Alignment.centerLeft,
                    fontFamily: AssetsData.fontFamily,
                    color: Constants.mainColor.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    text: 'Name',
                    hint: 'Example',
                    onSave: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name Can\'t be Empty';
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    text: 'Email',
                    hint: 'example@gmail.com',
                    onSave: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email Can\'t be Empty';
                      } else if (!value!.toString().contains('@') ||
                          value!.length < 12 ||
                          value!.length > 35) {
                        return 'Invalid Email';
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomPasswordTextFormField(
                    text: 'Password',
                    hint: '* * * * * *',
                    onSave: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password Can\'t be Empty';
                      } else if (value!.length < 6) {
                        return 'Password Can\'t be less than 6';
                      }
                    },
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState?.save();
                        if (kDebugMode) {
                          print('Valiation Done : Go to Maps Home Page');
                        }
                      }
                    },
                    text: 'Sign Up',
                  ),
                ],
              ),
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
                    goToRegisterView();
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
        ));
  }
}
