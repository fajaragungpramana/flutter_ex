import 'package:flutter/material.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';

class ExHorizontalTextButton extends StatelessWidget {
  final String labelText;
  final String buttonText;
  final Function() onTap;

  const ExHorizontalTextButton({
    Key? key,
    required this.labelText,
    required this.buttonText,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
            labelText,
            style: AppStyle.textRegular(
                fontSize: 12,
                color: AppColor.black50
            )
        ),

        const SizedBox(width: 4),

        GestureDetector(
            onTap: () => { onTap() },
            child: Text(
                buttonText,
                style: AppStyle.textSemiBold(
                    fontSize: 12,
                    color: AppColor.green100
                )
            )
        )

      ]
  );

}