import 'package:flutter/material.dart';
import 'package:flutter_googlemaps_bloc/core/widgets/custom_buttom.dart';
import 'package:flutter_googlemaps_bloc/Features/Auth/presentation/widgets/custom_social_button_icon.dart';
import 'package:flutter_googlemaps_bloc/core/utils/constants.dart';
import 'package:flutter_googlemaps_bloc/core/widgets/app_logo_and_name.dart';
import 'package:flutter_googlemaps_bloc/core/widgets/custom_text.dart';
import 'package:flutter_googlemaps_bloc/Features/Auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter_googlemaps_bloc/core/utils/assets.dart';
import 'package:flutter_googlemaps_bloc/core/widgets/logo_GIF.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LogInViewBody());
  }
}

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
          // Sign In Section
          Form(
            key: formKey,
            child: Column(
              children: [
                CustomText(
                  text: 'Sign in ',
                  alignment: Alignment.centerLeft,
                  fontFamily: AssetsData.fontFamily,
                  color: Constants.mainColor.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  text: 'Email',
                  hint: 'example@gmail.com',
                  onSave: (value) {
                    print('Email: $value');
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email Can\'t be Empty';
                    } else if (value.length > 100) {
                      return 'Too Long Email';
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomPasswordTextFormField(
                  text: 'Password',
                  hint: '* * * * * * ',
                  onSave: (value) {
                    print('PassWrd :$value');
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password Can\'t be Empty';
                    }
                  },
                ),
                const SizedBox(height: 40),
                CustomButton(
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState?.save();
                      print('Valiation Done : Go to Maps Home Page');
                    }
                  },
                  text: 'SIGN IN',
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          // Register Route and Other Log in Methods

          // Register Route
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: 'Don\'t have an account, ',
                alignment: Alignment.center,
                fontFamily: AssetsData.fontFamily,
                fontSize: 13,
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  print('Go To register Page ');
                },
                child: const CustomText(
                  text: 'sign up here',
                  color: Constants.mainColor,
                  alignment: Alignment.center,
                  fontFamily: AssetsData.fontFamily,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          // -OR-
          const SizedBox(height: 15),
          const CustomText(
            text: '-OR-',
            fontWeight: FontWeight.bold,
            alignment: Alignment.center,
            fontFamily: AssetsData.fontFamily,
            fontSize: 14,
          ),
          const SizedBox(height: 15),
          // Other Sign In Methods
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomSocialButtonIcon(
                onPress: () {
                  print('Google Sign In');
                },
                imageName: AssetsData.googleIcon,
              ),
              CustomSocialButtonIcon(
                onPress: () {
                  print('FaceBook Sign In');
                },
                imageName: AssetsData.facebookIcon,
              ),
              CustomSocialButtonIcon(
                onPress: () {
                  print('Phone Sign In');
                },
                iconData: Icons.phone,
              ),
            ],
          )
        ],
      ),
    );
  }
}
