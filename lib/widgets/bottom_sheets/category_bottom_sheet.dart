import 'package:flutter/material.dart';
import 'package:flutter_ex/core/domain/category/model/category.dart';
import 'package:flutter_ex/extension/string_extension.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/widgets/views/ex_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryBottomSheet extends StatelessWidget {
  final List<Category> listCategory;
  final Function(Category) onItemTap;

  const CategoryBottomSheet({
    Key? key,
    required this.listCategory,
    required this.onItemTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ExBottomSheet(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              AppLocalizations.of(context)!.chooseCategory,
              style: AppStyle.textSemiBold(),
            ),

            const SizedBox(height: 8),

            ListView.builder(
                shrinkWrap: true,
                itemCount: listCategory.length,
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: GestureDetector(
                        onTap: () => { onItemTap(listCategory[index]) },
                        child: Text(
                          listCategory[index].name.orEmpty,
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