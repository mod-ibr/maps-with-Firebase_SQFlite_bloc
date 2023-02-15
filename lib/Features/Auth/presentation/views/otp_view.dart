import 'package:flutter/material.dart';
import 'package:flutter_googlemaps_bloc/features/auth/presentation/widgets/otp_view_body.dart';

class OTPView extends StatelessWidget {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OTPViewBody());
  }
}

