import 'package:flutter/cupertino.dart';
import 'package:flutter_ex/gen/assets.gen.dart';

class ExBottomSheet extends StatelessWidget {
  final Widget child;

  const ExBottomSheet({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) => Wrap(
    children: [

      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(
                width: 80,
                height: 8,
                child: Assets.lib.resources.drawables.icSlider.image(
                    fit: BoxFit.contain
                )
            ),

            const SizedBox(height: 24),

            child

          ]
        )
      )

    ]
  );

}