import 'package:flutter/material.dart';
import 'package:todo_app/config/constants.dart';

class CategoriesDelegate extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;
  final Widget child;
  final List<String> categories;

  CategoriesDelegate({
    required this.backgroundColor,
    required this.child,
    required this.categories,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (overlapsContent) {
      return SizedBox(
        height: shrinkOffset < 70 ? 110 - shrinkOffset : 40,
        // width: 20,
        child: ColoredBox(
          color: scaffoldColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultTabController(
              length: categories.length,
              child: TabBar(tabs: [
                for (int i = 0; i < categories.length; i++)
                  Tab(
                    child: Text(
                      categories[i],
                      style: const TextStyle(color: Colors.black),
                    ),
                  )
              ]),
            ),
          ),
        ),
      );
    }

    return child;
  }

  @override
  double get maxExtent => 110;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
