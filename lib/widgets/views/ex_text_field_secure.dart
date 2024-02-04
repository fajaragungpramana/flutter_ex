import 'package:flutter/material.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';

class ExTextFieldSecure extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String errorText;

  const ExTextFieldSecure({super.key, required this.controller, required this.labelText, this.errorText = ""});

  @override
  State<StatefulWidget> createState() => _ExTextFieldSecureState();

}

class _ExTextFieldSecureState extends State<ExTextFieldSecure> {
  bool _isTextVisible = false;

  @override
  Widget build(BuildContext context) => TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.gray50),
              borderRadius: BorderRadius.circular(10)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          labelText: widget.labelText,
          labelStyle: AppStyle.textRegular(color: AppColor.black50),
          suffixIcon: IconButton(
              icon: Icon(
                  _isTextVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColor.gray50
              ),
              onPressed: () {
                setState(() {
                  _isTextVisible = !_isTextVisible;
                });
              }),
          errorText: widget.errorText.isEmpty ? null : widget.errorText
      ),
      obscureText: !_isTextVisible,
      enableSuggestions: false,
      autocorrect: false
  );

}