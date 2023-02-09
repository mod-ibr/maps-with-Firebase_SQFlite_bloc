import 'package:flutter/material.dart';
import 'package:flutter_googlemaps_bloc/Features/Auth/data/presentation/views/authView.dart';
import 'package:flutter_googlemaps_bloc/core/utils/assets.dart';
import 'package:flutter_googlemaps_bloc/core/utils/constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const AuthView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: height * 0.5,
            child: Image.asset(
              AssetsData.logo,
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            KappName,
            style: TextStyle(fontSize: 45, color: KMainColor),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
