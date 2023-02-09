import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_googlemaps_bloc/Features/splashView/view/splashView.dart';
import 'package:flutter_googlemaps_bloc/core/utils/appRouter.dart';
import 'package:flutter_googlemaps_bloc/core/utils/assets.dart';
import 'package:flutter_googlemaps_bloc/core/utils/constants.dart';
import 'package:flutter_googlemaps_bloc/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData(
          fontFamily: AssetsData.fontFamily, backgroundColor: KbackGroundColor),
      debugShowCheckedModeBanner: false,
    );
  }
}
