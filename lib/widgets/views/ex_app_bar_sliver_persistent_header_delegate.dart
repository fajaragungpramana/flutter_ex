import 'package:flutter/material.dart';

class ExAppBarSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final AppBar appBar;

  const ExAppBarSliverPersistentHeaderDelegate({required this.appBar});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => appBar;

  @override
  double get maxExtent => appBar.preferredSize.height;

  @override
  double get minExtent => appBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;

}