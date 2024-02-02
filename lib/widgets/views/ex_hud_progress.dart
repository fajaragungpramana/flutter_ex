import 'package:flutter/material.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExHudProgress extends StatelessWidget {
  const ExHudProgress({super.key});

  @override
  Widget build(BuildContext context) =>
      Center(
        child:
        Wrap(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [

                  const CircularProgressIndicator(
                    color: AppColor.green100
                  ),

                  const SizedBox(height: 8),

                  Text(
                    AppLocalizations.of(context)!.loading,
                    style: AppStyle.textSemiBold(fontSize: 14),
                  )

                ],
              )
            )
          ]
        )
      );

}