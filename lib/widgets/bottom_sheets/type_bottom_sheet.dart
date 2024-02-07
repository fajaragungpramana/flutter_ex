import 'package:flutter/material.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/widgets/views/ex_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TypeBottomSheet extends StatelessWidget {
  const TypeBottomSheet({super.key});
  
  @override
  Widget build(BuildContext context) => ExBottomSheet(
      widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              AppLocalizations.of(context)!.chooseType,
              style: AppStyle.textSemiBold(),
            )

          ]
      )
  );
  
}