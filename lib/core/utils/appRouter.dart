import 'package:flutter_googlemaps_bloc/Features/Auth/data/presentation/views/authView.dart';
import 'package:flutter_googlemaps_bloc/Features/splashView/view/splashView.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kAuthView = '/authView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kAuthView,
        builder: (context, state) => const AuthView(),
      ),
    ],
  );
}
