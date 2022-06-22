import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_plus/share_plus.dart';
import 'package:todo_app/config/constants.dart';
import 'package:todo_app/domain/task_repository/task_repository.dart';
import 'package:todo_app/providers/categories_providers.dart';
import 'package:todo_app/providers/tasks_providers.dart';
import 'package:todo_app/view/pages/add_task/add_task_screen.dart';
import 'package:todo_app/view_models/tasks_provider.dart';

import 'widgets/categories_delegate.dart';
import 'widgets/loading_tasks_screen.dart';
import 'widgets/padding_wrappers.dart';
import 'utils/hex_color_extension.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;

    final tasksState = ref.watch(tasksNotifierProvider);

    late List<TaskModel> tasks;

    if (tasksState is TasksInitial) {
      return Container();
    } else if (tasksState is TasksLoading && tasksState.value.isEmpty) {
      return const LoadingTasksScreen();
    } else if (tasksState is TasksLoaded) {
      tasks = tasksState.value;
    } else if (tasksState is TasksLoading) {
      tasks = tasksState.value;
    }

    List<String> categories = <String>[];
    for (int i = 0; i < tasks.length; i++) {
      categories.add(tasks[i].category);
    }
    tasks.map((e) {
      categories.add(e.category);
    }).toList();

    categories = categories.toSet().toList();

    List<Color> colours = [Colors.red, Colors.blue, Colors.purple, Colors.teal];
    Map<String, Color> categoriesColors = {};

    for (int i = 0; i < categories.length; i++) {
      categoriesColors[categories[i]] = colours[i % 4];
    }

    final category = ref.watch(categoriesProvider);

    late List<TaskModel> filteredTasks;
    if (category == '') {
      filteredTasks = tasks;
    } else {
      filteredTasks = tasks.where((task) => task.category == category).toList();
    }

    return Stack(
      children: [
        IgnorePointer(
          ignoring: tasksState is TasksLoading,
          child: Scaffold(
            backgroundColor: scaffoldColor,
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
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
                  SliverPersistentHeader(
                    // floating: true,
                    pinned: true,
                    delegate: CategoriesDelegate(
                      backgroundColor: Colors.white,
                      categories: categories,
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
                                child: InkWell(
                                  onTap: () => ref
                                      .read(categoriesProvider.notifier)
                                      .state = categories[index],
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      left: 20,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          color: categoriesColors[
                                              categories[index]],
                                          backgroundColor:
                                              const Color(0xFFE9EDFF),
                                          value: tasks
                                                  .where((element) =>
                                                      element.category ==
                                                      categories[index])
                                                  .where((element) =>
                                                      element.completed)
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
                              ),
                            );
                          },
                          itemCount: categories.length,
                        ),
                      ),
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
                  SliverAnimatedList(
                    key: Key('$category # ${filteredTasks.length}'),
                    itemBuilder: (ctx, index, animator) {
                      return Slidable(
                        key: Key(filteredTasks[index].id),
                        startActionPane: ActionPane(
                          extentRatio: 0.5,
                          motion: const DrawerMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (_) {
                                if (filteredTasks.length == 1) {
                                  ref.read(categoriesProvider.notifier).state =
                                      '';
                                }
                                ref
                                    .read(tasksNotifierProvider.notifier)
                                    .delete(filteredTasks[index]);
                              },
                              backgroundColor: const Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                            SlidableAction(
                              onPressed: (_) {
                                Share.share(filteredTasks[index].name);
                              },
                              backgroundColor: const Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.share,
                              label: 'Share',
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            ref.read(categoriesProvider.notifier).state = '';
                            ref
                                .read(tasksNotifierProvider.notifier)
                                .complete(filteredTasks[index]);
                          },
                          child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: defaultPaddingWrapper(
                                size: size,
                                child: Stack(
                                  children: [
                                    Container(
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
                                            filteredTasks[index].completed
                                                ? Icons.check_circle
                                                : Icons.circle_outlined,
                                            color: filteredTasks[index].color !=
                                                    null
                                                ? HexColor.fromHex(
                                                    filteredTasks[index].color!)
                                                : categoriesColors[
                                                    filteredTasks[index]
                                                        .category],
                                          ),
                                          const SizedBox(width: 25),
                                          Text(
                                            filteredTasks[index].name,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: filteredTasks[index].isImportant,
                                      child: const Center(
                                        widthFactor: 0,
                                        heightFactor: 2.5,
                                        child: Icon(Icons.star,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      );
                    },
                    initialItemCount: filteredTasks.length,
                  )
                ],
              ),
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
        ),
        Visibility(
          visible: tasksState is TasksLoading,
          child: Scaffold(
            backgroundColor:
                const Color.fromARGB(255, 32, 28, 28).withOpacity(0.5),
            body: const Center(
                child: SpinKitWave(
              color: Colors.white,
            )),
          ),
        )
      ],
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
