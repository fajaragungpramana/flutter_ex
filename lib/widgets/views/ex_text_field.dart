import 'package:flutter/material.dart';

import '../../resources/values/app_color.dart';

class ExTextField extends StatelessWidget {
  final String labelText;
  final String errorText;
  final Function(String)? onChanged;

  const ExTextField({super.key, required this.labelText, required this.errorText, this.onChanged});

  @override
  Widget build(BuildContext context) =>
      TextField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.gray50),
                  borderRadius: BorderRadius.circular(10)
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              labelText: labelText,
              errorText: errorText.isEmpty ? null : errorText
          ),
          onChanged: onChanged
      );

}