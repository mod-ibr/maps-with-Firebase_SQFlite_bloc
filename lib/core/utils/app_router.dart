import 'package:flutter_googlemaps_bloc/features/auth/presentation/views/otp_view.dart';

import '../../features/Auth/presentation/views/logIn_view.dart';
import '../../features/Auth/presentation/views/phone_auth_view.dart';
import '../../features/Auth/presentation/views/register_view.dart';
import '../../features/splashView/view/splash_view.dart';

abstract class AppRouter {
  static const splashView = SplashView();

  static const logInView = LogInView();
  static const registerView = RegisterView();
  static const phoneAuthView = PhoneAuthView();
  static const otpView = OTPView();
}
