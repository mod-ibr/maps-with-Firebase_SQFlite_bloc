import 'package:flutter_googlemaps_bloc/Features/Auth/data/presentation/views/authView.dart';
import 'package:flutter_googlemaps_bloc/Features/splashView/view/splashView.dart';

abstract class AppRouter {
  static const splashView = SplashView();

  static const authView = AuthView();
}
