import 'package:flutter/material.dart';

import '../../resources/values/app_style.dart';
import 'ex_flexible_space_bar.dart';

class ExCollapseScaffold extends StatelessWidget {
  final bool backEnable;
  final bool collapseEnable;
  final String titleText;
  final List<Widget> body;
  final Widget? footer;

  const ExCollapseScaffold({super.key, this. backEnable = false, this.collapseEnable = true, required this.titleText, required this.body, this.footer});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 100.0,
            collapsedHeight: collapseEnable ? 56 : 100.0,
            pinned: true,
            flexibleSpace: ExFlexibleSpaceBar(
              titlePadding: EdgeInsetsTween(
                  begin: const EdgeInsets.all(16),
                  end: EdgeInsets.only(left: backEnable ? collapseEnable ? 56 : 16 : 16, top: 16, right: 16, bottom: 16)
              ),
              title: Text(
                  titleText,
                  style: AppStyle.textSemiBold()
              ),
              expandedTitleScale: collapseEnable ? 1.5 : 1,
            )
          )
        ],
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: body
                      )
                  )
              ),

              if (footer != null) footer!

            ]
          )
        )
      )
    )
  );

}