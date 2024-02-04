import 'package:flutter/cupertino.dart';

class ExBottomSheet extends StatelessWidget {
  final Widget widget;

  const ExBottomSheet({
    super.key,
    required this.widget
  });

  @override
  Widget build(BuildContext context) => Wrap(
    children: [

      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: widget
      )

    ]
  );

}