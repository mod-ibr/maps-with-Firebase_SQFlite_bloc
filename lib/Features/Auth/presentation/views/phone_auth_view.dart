import 'package:flutter/material.dart';
import '../../../../features/Auth/presentation/widgets/phone_auth_view_body.dart';

class PhoneAuthView extends StatelessWidget {
  const PhoneAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: PhoneAuthViewBody(),
    );
  }
}
