import 'package:flutter_googlemaps_bloc/features/Auth/presentation/views/logIn_view.dart';
import 'package:flutter_googlemaps_bloc/features/Auth/presentation/views/phone_auth_view.dart';
import 'package:flutter_googlemaps_bloc/features/Auth/presentation/views/register_view.dart';
import 'package:flutter_googlemaps_bloc/features/splashView/view/splash_view.dart';

abstract class AppRouter {
  static const splashView = SplashView();

  static const logInView = LogInView();
  static const registerView = RegisterView();
  static const phoneAuthView = PhoneAuthView();
}
