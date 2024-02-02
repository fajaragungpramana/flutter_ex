import 'package:flutter/material.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';

class ExButton extends StatelessWidget {
  final String labelText;
  final Color labelColor;
  final bool enable;
  final Color backgroundColor;
  final Function() onPressed;

  const ExButton({
    super.key,
    required this.labelText,
    this.labelColor = Colors.white,
    this.enable = true,
    this.backgroundColor = AppColor.green100,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) => SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: enable ? onPressed : null,
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              )
          ),
          child: Text(
              labelText,
              style: AppStyle.textSemiBold(
                  fontSize: 16,
                  color: labelColor
              )
          )
      )
  );

}