import 'package:flutter_googlemaps_bloc/Features/Auth/presentation/views/logIn_view.dart';
import 'package:flutter_googlemaps_bloc/Features/Auth/presentation/views/register_view.dart';
import 'package:flutter_googlemaps_bloc/Features/splashView/view/splashView.dart';

abstract class AppRouter {
  static const splashView = SplashView();

  static const logInView = LogInView();
  static const registerView = RegisterView();
}
