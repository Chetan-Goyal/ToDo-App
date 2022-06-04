import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo_app/config/constants.dart';

import 'padding_wrappers.dart';

class LoadingTasksScreen extends StatelessWidget {
  const LoadingTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.white.withOpacity(0),
            leading: InkWell(
              child: Icon(
                Icons.menu,
                size: 0.09 * size.width,
                color: lightGreyColor,
              ),
            ),
            actions: [
              Icon(
                Icons.search,
                size: 0.09 * size.width,
                color: lightGreyColor,
              ),
              SizedBox(width: 0.05 * size.width),
              Icon(
                Icons.notifications,
                size: 0.09 * size.width,
                color: lightGreyColor,
              ),
              const SizedBox(height: 20),
            ],
          ),
          SizedBox(height: 10),
          defaultPaddingWrapper(
            size: size,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[400]!,
                highlightColor: Colors.grey[100]!,
                period: const Duration(seconds: 2),
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: Colors.grey[400]!,
                    shape: const RoundedRectangleBorder(),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          defaultPaddingWrapper(
            size: size,
            child: headingWrapper(
              title: 'CATEGORIES',
              margin: 0.6 * size.width,
            ),
          ),
          SizedBox(
            height: 110,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    constraints: BoxConstraints.tight(const Size(200, 110)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 10,
                        bottom: 10,
                      ),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[400]!,
                        highlightColor: Colors.grey[100]!,
                        period: const Duration(seconds: 2),
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: ShapeDecoration(
                            color: Colors.grey[400]!,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 4,
            ),
          ),
          const SizedBox(height: 20),
          defaultPaddingWrapper(
            size: size,
            child: headingWrapper(
              title: 'TODAY\'S TASKS',
              margin: 0.55 * size.width,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: defaultPaddingWrapper(
                  size: size,
                  child: Container(
                    constraints: BoxConstraints.tight(
                      Size(
                        size.width * 0.95,
                        60,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[400]!,
                      highlightColor: Colors.grey[100]!,
                      period: const Duration(seconds: 2),
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: Colors.grey[400]!,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: 7,
          ),
        ],
      ),
    );
  }
}
