import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';

import '../../../../core/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text;

  final String? hint;

  final Function onSave;
  final Function validator;

  const CustomTextFormField({
    super.key,
    this.text,
    this.hint,
    required this.onSave,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text!,
          fontSize: 14,
          color: Colors.grey.shade800,
        ),
        TextFormField(
          onSaved: (value) => onSave(value),
          validator: (value) => validator(value),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.black54,
            ),
            fillColor: Colors.white,
          ),
        )
      ],
    );
  }
}

class CustomTextFormFieldForPhone extends StatelessWidget {
  final String? text;

  final String? hint;

  final Function onSave;
  final Function validator;
  final TextInputType textInputType;

  const CustomTextFormFieldForPhone({super.key, 
    this.text,
    this.hint,
    this.textInputType = TextInputType.phone,
    required this.onSave,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text!,
          fontSize: 14,
          color: Colors.grey.shade800,
        ),
        TextFormField(
          onSaved: (value) => onSave(value),
          validator: (value) => validator(value),
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.black54,
            ),
            fillColor: Colors.white,
          ),
        )
      ],
    );
  }
}

class CustomPasswordTextFormField extends StatelessWidget {
  final String text;

  final String hint;

  final Function onSave;
  final Function validator;

  const CustomPasswordTextFormField({super.key, 
    this.text = 'Email',
    this.hint = 'example@gmail.com',
    required this.onSave,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 14,
          color: Colors.grey.shade800,
        ),
        TextFormField(
          // obscureText: controller.obscureText.value,
          onSaved: (value) => onSave(value!),
          validator: (value) => validator(value!),
          decoration: InputDecoration(
            suffix: InkWell(
              onTap: () {
                if (kDebugMode) {
                  print('Toogel Visibility Of Password');
                }
              },
              child: const Icon(
                (Icons.visibility),
                color: Constants.mainColor,
              ),
            ),
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.black54,
            ),
            fillColor: Colors.white,
          ),
        )
      ],
    );
  }
}
