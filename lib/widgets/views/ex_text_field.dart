import 'package:flutter/material.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';

class ExTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String errorText;
  final String? label;
  final bool readOnly;
  final Widget? suffixIcon;
  final Function()? onTap;

  const ExTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.errorText = "",
    this.label,
    this.readOnly = false,
    this.suffixIcon,
    this.onTap
  });

  @override
  Widget build(BuildContext context) =>
      TextField(
          controller: controller,
          readOnly: readOnly,
          onTap: () => { if (onTap != null) { onTap!() } },
          decoration: InputDecoration(
              suffixIcon: suffixIcon,
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.gray50),
                  borderRadius: BorderRadius.circular(10)
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.green100),
                  borderRadius: BorderRadius.circular(10)
              ),
              labelText: labelText,
              labelStyle: AppStyle.textRegular(color: AppColor.black50),
              errorText: errorText.isEmpty ? null : errorText
          )
      );

}