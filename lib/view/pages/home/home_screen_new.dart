import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:todo_app/config/constants.dart';
import 'package:todo_app/domain/task_repository/src/models/models.dart';
import 'package:todo_app/providers/tasks_providers.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:todo_app/utils/loading_util.dart';
import 'package:todo_app/view/pages/add_task/add_task_screen.dart';
import 'package:todo_app/view_models/tasks_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static final ZoomDrawerController _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;

    return ZoomDrawer(
      controller: _drawerController,
      showShadow: false,
      angle: 0,
      slideWidth: size.width * 0.85,
      menuBackgroundColor: const Color(0xFF0D2260),
      borderRadius: 50,
      mainScreenScale: 0.2,
      menuScreen: Scaffold(
          backgroundColor: const Color(0xFF0D2260),
          body: Padding(
            padding: EdgeInsets.only(
              top: size.width * 0.25,
              left: size.width * 0.1,
              bottom: size.width * 0.25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: CircleAvatar(
                        backgroundImage: Image.network(
                          'https://via.placeholder.com/150',
                        ).image,
                        radius: 50,
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () => _drawerController.toggle!.call(),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'Name is here',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                ),
                DrawerTileWidget(
                  item: DrawerItem(
                    DrawerItemType.templates,
                    'Templates',
                    Icons.bookmark_border_rounded,
                  ),
                ),
                DrawerTileWidget(
                  item: DrawerItem(
                    DrawerItemType.categories,
                    'Categories',
                    Icons.grid_view_outlined,
                  ),
                ),
                DrawerTileWidget(
                  item: DrawerItem(
                    DrawerItemType.analytics,
                    'Analytics',
                    Icons.auto_graph_sharp,
                  ),
                ),
                DrawerTileWidget(
                  item: DrawerItem(
                    DrawerItemType.settings,
                    'Settings',
                    Icons.settings,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 200,
                  height: 100,
                  child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    primaryXAxis: CategoryAxis(
                      isVisible: false,
                      //Hide the gridlines of x-axis
                      majorGridLines: const MajorGridLines(width: 0),
                      //Hide the axis line of x-axis
                      axisLine: const AxisLine(width: 0),
                    ),
                    primaryYAxis: CategoryAxis(
                      isVisible: false,
                      //Hide the gridlines of y-axis
                      majorGridLines: const MajorGridLines(width: 0),
                      //Hide the axis line of y-axis
                      axisLine: const AxisLine(width: 0),
                    ),
                    series: <SplineSeries<List, String>>[
                      SplineSeries<List, String>(
                        dataSource: const [
                          ["Monday", 4],
                          ['Tuesday', 5],
                          ['Wednesday', 2],
                          ['Thursday', 3],
                          ['Friday', 8],
                          ['Saturday', 5],
                          ['Sunday', 0],
                        ],
                        xValueMapper: (List sales, _) => sales[0],
                        yValueMapper: (List sales, _) => sales[1] as int,
                      )
                    ],
                  ),
                ),
                const Text(
                  'Good',
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Consistency',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )),
      mainScreen: Scaffold(
        backgroundColor: scaffoldColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.white.withOpacity(0),
              leading: InkWell(
                onTap: () => _drawerController.toggle!.call(),
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
              ],
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: defaultPaddingWrapper(
                size: size,
                child: Container(
                  margin: EdgeInsets.only(right: 0.2 * size.width),
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
                size: size,
                child: headingWrapper(
                  title: 'CATEGORIES',
                  margin: 0.6 * size.width,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 110,
                child: Builder(builder: (context) {
                  TasksState state = ref.watch(tasksNotifierProvider);

                  if (state is TasksInitial) {
                    return const Center(
                      child:
                          Text("Please wait while we are fetching your tasks!"),
                    );
                  }

                  // if (state is TasksLoading && state.value.isEmpty) {
                  //   return const Center(
                  //     child: Text("Add your tasks to view them here!"),
                  //   );
                  // }

                  if (state is TasksError) {
                    return const Center(
                      child: Text("Error faced while fetching tasks!"),
                    );
                  }

                  late List<TaskModel> tasks;
                  if (state is TasksLoaded) {
                    tasks = state.value;
                    LoadingUtil(context).stopLoading();
                  } else if (state is TasksLoading) {
                    tasks = state.value;
                    Future.delayed(Duration.zero, () {
                      LoadingUtil(context).startLoading();
                    });
                  }

                  // For adding categories header widget
                  final categories = getCategories(tasks);
                  final categoriesColors = getCategoriesColors(categories);

                  return ListView.builder(
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
                                  "${tasks.where((element) => element.category == categories[index]).length} Tasks",
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
                                          .where((element) => element.completed)
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
                  );
                }),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: defaultPaddingWrapper(
                size: size,
                child: headingWrapper(
                  title: 'TODAY\'S TASKS',
                  margin: 0.55 * size.width,
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                TasksState state = ref.read(tasksNotifierProvider);

                if (state is TasksInitial || state is TasksError) {
                  return const SliverToBoxAdapter();
                }

                if (state is TasksLoading && state.value.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text("Add your tasks to view them here!"),
                    ),
                  );
                }

                late List<TaskModel> tasks;
                if (state is TasksLoaded) {
                  tasks = state.value;
                } else if (state is TasksLoading) {
                  tasks = state.value;
                }

                // For adding categories header widget
                final categories = getCategories(tasks);
                final categoriesColors = getCategoriesColors(categories);

                return SliverAnimatedList(
                  itemBuilder: (ctx, index, animator) {
                    return Slidable(
                      key: Key(tasks[index].id),
                      startActionPane: ActionPane(
                        extentRatio: 0.5,
                        motion: const DrawerMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (_) {
                              ref
                                  .read(tasksNotifierProvider.notifier)
                                  .delete(tasks[index]);
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                          SlidableAction(
                            onPressed: (_) {
                              Share.share(tasks[index].name);
                            },
                            backgroundColor: const Color(0xFF21B7CA),
                            foregroundColor: Colors.white,
                            icon: Icons.share,
                            label: 'Share',
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () => ref
                            .read(tasksNotifierProvider.notifier)
                            .complete(tasks[index]),
                        child: Padding(
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
                                child: Row(
                                  children: [
                                    const SizedBox(width: 20),
                                    Icon(
                                      tasks[index].completed
                                          ? Icons.check_circle
                                          : Icons.circle_outlined,
                                      color: categoriesColors[
                                          tasks[index].category],
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
                              ),
                            )),
                      ),
                    );
                  },
                  initialItemCount: tasks.length,
                );

                // return Stack(fit: StackFit.expand, children: [
                //   // SizedBox(
                //   //   height: MediaQuery.of(context).size.height,
                //   //   width: MediaQuery.of(context).size.width,
                //   //   child: Visibility(
                //   //     visible: state is TasksLoading,
                //   //     child: const Center(
                //   //       child: CircularProgressIndicator(),
                //   //     ),
                //   //   ),
                //   // )
                // ]);
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            dynamic result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTaskScreen(),
              ),
            );
            if (result == true) {
              await ref.read(tasksNotifierProvider.notifier).getTasks();
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
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

enum DrawerItemType { templates, categories, analytics, settings }

class DrawerItem {
  final DrawerItemType type;
  final IconData icon;
  final String title;

  DrawerItem(this.type, this.title, this.icon);

  String get path => drawerItems[type] ?? 'unknown';
}

Map<DrawerItemType, String> drawerItems = {
  DrawerItemType.templates: 'templates',
  DrawerItemType.analytics: 'analytics',
  DrawerItemType.categories: 'categories',
  DrawerItemType.settings: 'settings',
};

class DrawerTileWidget extends StatelessWidget {
  const DrawerTileWidget({Key? key, required this.item}) : super(key: key);

  final DrawerItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(item.icon, color: Colors.white),
      title: Text(item.title, style: const TextStyle(color: Colors.white)),
      // horizontalTitleGap: 5,
      onTap: null,
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final double year;
  final double sales;
}

List<String> getCategories(List<TaskModel> tasks) {
  List<String> categories = <String>[];
  for (int i = 0; i < tasks.length; i++) {
    categories.add(tasks[i].category);
  }
  tasks.map((e) {
    categories.add(e.category);
  }).toList();

  categories = categories.toSet().toList();

  return categories;
}

Map<String, Color> getCategoriesColors(List<String> categories) {
  List<Color> colours = [Colors.red, Colors.blue, Colors.purple, Colors.teal];
  Map<String, Color> categoriesColors = {};

  for (int i = 0; i < categories.length; i++) {
    categoriesColors[categories[i]] = colours[i % 4];
  }

  return categoriesColors;
}