import 'package:flutter/material.dart';

import '../../resources/values/app_color.dart';

class ExTextFieldSecure extends StatefulWidget {
  final String labelText;
  final String errorText;
  final Function(String)? onChanged;

  const ExTextFieldSecure({super.key, required this.labelText, required this.errorText, this.onChanged});

  @override
  State<StatefulWidget> createState() => _ExTextFieldSecureState();

}

class _ExTextFieldSecureState extends State<ExTextFieldSecure> {
  bool _isTextVisible = false;

  @override
  Widget build(BuildContext context) => TextField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.gray50),
              borderRadius: BorderRadius.circular(10)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          labelText: widget.labelText,
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
      autocorrect: false,
      onChanged: widget.onChanged);

}