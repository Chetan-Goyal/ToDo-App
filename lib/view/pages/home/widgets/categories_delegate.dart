import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/config/constants.dart';
import 'package:todo_app/providers/categories_providers.dart';

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
    if (shrinkOffset > 11) {
      return SizedBox(
        height: shrinkOffset < 70 ? 110 - shrinkOffset : 40,
        child: ColoredBox(
          color: shrinkOffset < 70 ? scaffoldColor : Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 8.0,
              bottom: 8.0,
              right: 8.0,
            ),
            child: DefaultTabController(
              length: categories.length,
              child: TabBar(tabs: [
                for (int i = 0; i < categories.length; i++)
                  Consumer(builder: (context, ref, _) {
                    return InkWell(
                      onTap: () => ref.read(categoriesProvider.notifier).state =
                          categories[i],
                      child: Tab(
                        child: Text(
                          categories[i],
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  })
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
