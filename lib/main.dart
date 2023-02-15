import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_googlemaps_bloc/core/utils/app_router.dart';
import 'core/services/shared_preferences.dart';
import 'core/utils/assets.dart';
import 'core/utils/constants.dart';
import 'firebase_options.dart';

late bool isFirstAppRun;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  isFirstAppRun = await LocalSharedPreferences.isFirstAppRun();
  if (kDebugMode) {
    print('Is First App Run : $isFirstAppRun');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: AssetsData.fontFamily,
          backgroundColor: Constants.backGroundColor),
      debugShowCheckedModeBanner: false,
      home: (isFirstAppRun) ? AppRouter.splashView : AppRouter.logInView,
    );
  }
}
