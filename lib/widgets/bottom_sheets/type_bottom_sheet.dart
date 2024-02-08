import 'package:flutter/material.dart';
import 'package:flutter_ex/core/data/remote/type/response/type_response.dart';
import 'package:flutter_ex/core/data/remote/user/response/wallet_response.dart';
import 'package:flutter_ex/extension/string_extension.dart';
import 'package:flutter_ex/gen/assets.gen.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/widgets/views/ex_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TypeBottomSheet extends StatelessWidget {
  final List<TypeResponse> listType;
  final Function(TypeResponse) onItemPressed;

  const TypeBottomSheet({
    Key? key,
    required this.listType,
    required this.onItemPressed
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) => ExBottomSheet(
      widget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Assets.lib.resources.drawables.icSlider.image(),

            const SizedBox(height: 24),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.chooseType,
                style: AppStyle.textSemiBold(),
              )
            ),

            const SizedBox(height: 8),

            ListView.builder(
                shrinkWrap: true,
                itemCount: listType.length,
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: TextButton(
                      onPressed: () => { onItemPressed(listType[index]) },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          WalletResponse.mapType(context, listType[index].name.orEmpty),
                          style: AppStyle.textRegular(),
                          textAlign: TextAlign.start,
                        )
                      )
                    )
                )
            )

          ]
      )
  );
  
}