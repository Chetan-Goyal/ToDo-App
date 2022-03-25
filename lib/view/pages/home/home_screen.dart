import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:todo_app/config/constants.dart';
import 'package:todo_app/providers/tasks_providers.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ZoomDrawerController _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size _size = MediaQuery.of(context).size;

    final provider = ref.watch(tasksNotifierProvider);

    return provider.when(
      initial: () {
        return Container();
      },
      loading: (tasks) {
        return const Center(child: CircularProgressIndicator());
      },
      error: (message) {
        return Center(child: Text(message));
      },
      loaded: (tasks) {
        List<String> categories = <String>[];
        for (int i = 0; i < tasks.length; i++) {
          categories.add(tasks[i].category);
        }
        tasks.map((e) {
          categories.add(e.category);
        }).toList();

        categories = categories.toSet().toList();

        List<Color> colours = [
          Colors.red,
          Colors.blue,
          Colors.purple,
          Colors.teal
        ];
        Map<String, Color> categoriesColors = {};

        // print("Category: ${categories[0]}");
        for (int i = 0; i < categories.length; i++) {
          categoriesColors[categories[i]] = colours[i % 4];
        }

        return ZoomDrawer(
          controller: _drawerController,
          showShadow: false,
          angle: 0,
          // backgroundColor: Colors.grey,
          slideWidth: MediaQuery.of(context).size.width * 0.65,
          shadowLayer1Color: Colors.green,
          shadowLayer2Color: Colors.greenAccent,
          backgroundColor: Colors.grey[300]!,
          menuScreen: const Scaffold(
            backgroundColor: Colors.grey,
            // body: ColoredBox(
            // color: Colors.green,
            // ),
          ),
          mainScreen: Scaffold(
            backgroundColor: scaffoldColor,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: Colors.white.withOpacity(0),
                  leading: InkWell(
                    onTap: () {
                      _drawerController.toggle?.call();
                    },
                    child: Icon(
                      Icons.menu,
                      size: 0.09 * _size.width,
                      color: lightGreyColor,
                    ),
                  ),
                  actions: [
                    Icon(
                      Icons.search,
                      size: 0.09 * _size.width,
                      color: lightGreyColor,
                    ),
                    SizedBox(width: 0.05 * _size.width),
                    Icon(
                      Icons.notifications,
                      size: 0.09 * _size.width,
                      color: lightGreyColor,
                    ),
                  ],
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(
                  child: defaultPaddingWrapper(
                    size: _size,
                    child: Container(
                      margin: EdgeInsets.only(right: 0.2 * _size.width),
                      child: const FittedBox(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'What\'s up, Chetan!',
                          style: TextStyle(
                            fontSize: 96,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 30)),
                SliverToBoxAdapter(
                  child: defaultPaddingWrapper(
                    size: _size,
                    child: headingWrapper(
                      title: 'CATEGORIES',
                      margin: 0.6 * _size.width,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 110,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            constraints:
                                BoxConstraints.tight(const Size(200, 110)),
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tasks
                                            .where((element) =>
                                                element.category ==
                                                categories[index])
                                            .length
                                            .toString() +
                                        " Tasks",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Color(0xFF9BA3C9)),
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    categories[index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21,
                                        color: Color(0xFF333A63)),
                                  ),
                                  const SizedBox(height: 10),
                                  // Spacer(),
                                  LinearProgressIndicator(
                                    color: categoriesColors[categories[index]],
                                    backgroundColor: const Color(0xFFE9EDFF),
                                    value: tasks
                                            .where((element) =>
                                                element.category ==
                                                categories[index])
                                            .where(
                                                (element) => element.completed)
                                            .length /
                                        tasks
                                            .where((element) =>
                                                element.category ==
                                                categories[index])
                                            .length,
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: categories.length,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(
                  child: defaultPaddingWrapper(
                    size: _size,
                    child: headingWrapper(
                      title: 'TODAY\'S TASKS',
                      margin: 0.55 * _size.width,
                    ),
                  ),
                ),
                SliverAnimatedList(
                  itemBuilder: (ctx, index, animator) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: defaultPaddingWrapper(
                          size: _size,
                          child: Container(
                            child: Row(
                              children: [
                                const SizedBox(width: 20),
                                Icon(
                                  tasks[index].completed
                                      ? Icons.check_circle
                                      : Icons.circle_outlined,
                                  color:
                                      categoriesColors[tasks[index].category],
                                ),
                                const SizedBox(width: 25),
                                Text(
                                  tasks[index].name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            constraints: BoxConstraints.tight(
                              Size(
                                MediaQuery.of(context).size.width * 0.95,
                                60,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ));
                  },
                  initialItemCount: tasks.length,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  defaultPaddingWrapper({required Widget child, required Size size}) {
    return Padding(
      padding:
          EdgeInsets.only(left: 0.08 * size.width, right: 0.08 * size.width),
      child: child,
    );
  }

  headingWrapper({required String title, required double margin}) {
    return Padding(
      padding: EdgeInsets.only(right: margin),
      child: FittedBox(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: lightGreyColor,
            fontSize: 48,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
