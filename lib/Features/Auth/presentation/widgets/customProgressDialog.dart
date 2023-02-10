import 'package:flutter/material.dart';
import 'package:flutter_googlemaps_bloc/core/utils/constants.dart';

class CustomProgressDialog extends StatelessWidget {
  final String status;

  CustomProgressDialog({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          const SizedBox(width: 5),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Constants.mainColor),
          ),
          const SizedBox(width: 30),
          Text(
            status,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
