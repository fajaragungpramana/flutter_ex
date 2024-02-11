import 'package:flutter/material.dart';
import 'package:flutter_ex/extension/string_extension.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/widgets/views/ex_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_ex/core/domain/type/model/type.dart';

class TypeBottomSheet extends StatelessWidget {
  final List<Type> listType;
  final Function(Type) onItemTap;

  const TypeBottomSheet({
    Key? key,
    required this.listType,
    required this.onItemTap
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) => ExBottomSheet(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              AppLocalizations.of(context)!.chooseType,
              style: AppStyle.textSemiBold(),
            ),

            const SizedBox(height: 8),

            ListView.builder(
                shrinkWrap: true,
                itemCount: listType.length,
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: GestureDetector(
                      onTap: () => { onItemTap(listType[index]) },
                      child: Text(
                        listType[index].name.orEmpty,
                        style: AppStyle.textRegular(),
                        textAlign: TextAlign.start,
                      )
                    )
                )
            )

          ]
      )
  );
  
}