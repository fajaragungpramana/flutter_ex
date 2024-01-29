import 'package:flutter/material.dart';

import '../../resources/values/app_color.dart';
import '../../resources/values/app_style.dart';

class ExButton extends StatelessWidget {
  final String labelText;
  final bool enable;
  final Function() onPressed;

  const ExButton({super.key, required this.labelText, this.enable = true, required this.onPressed});

  @override
  Widget build(BuildContext context) => SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: enable ? onPressed : null,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.green100,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              )
          ),
          child: Text(
              labelText,
              style: AppStyle.textSemiBold(
                  fontSize: 16,
                  color: Colors.white
              )
          )
      )
  );

}