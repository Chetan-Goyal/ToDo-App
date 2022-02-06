import 'package:flutter/material.dart';
import 'package:todo_app/config/constants.dart';
import 'package:todo_app/config/locator.dart';
import 'package:todo_app/domain/task_repository/src/models/models.dart';
import 'package:todo_app/domain/task_repository/src/task_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).viewPadding.top + 15),
              defaultPaddingWrapper(
                size: _size,
                child: Row(
                  children: [
                    Icon(
                      Icons.menu,
                      size: 0.09 * _size.width,
                      color: lightGreyColor,
                    ),
                    const Spacer(),
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
              ),
              SizedBox(height: 0.1 * _size.width),
              defaultPaddingWrapper(
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
              SizedBox(height: 0.11 * _size.width),
              defaultPaddingWrapper(
                size: _size,
                child: headingWrapper(
                  title: 'CATEGORIES',
                  margin: 0.6 * _size.width,
                ),
              ),
              FutureBuilder<List<TaskModel>>(
                  future: locator.get<TaskRepository>().getTasks(),
                  builder: (ctx, snapshot) {
                    // print(snapshot);
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const CircularProgressIndicator();
                    }

                    List<TaskModel> tasks = snapshot.data!;
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

                    print("Category: ${categories[0]}");
                    for (int i = 0; i < categories.length; i++) {
                      categoriesColors[categories[i]] = colours[i % 4];
                    }

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 110,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  constraints: BoxConstraints.tight(
                                      const Size(200, 110)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          tasks
                                                  .where((element) =>
                                                      element.category ==
                                                      categories[index])
                                                  .length
                                                  .toString() +
                                              " Tasks",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Color(0xFF9BA3C9)),
                                        ),
                                        SizedBox(height: 7),
                                        Text(
                                          categories[index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 21,
                                              color: Color(0xFF333A63)),
                                        ),
                                        SizedBox(height: 10),
                                        // Spacer(),
                                        LinearProgressIndicator(
                                          color: categoriesColors[
                                              categories[index]],
                                          backgroundColor: Color(0xFFE9EDFF),
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
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: categories.length,
                          ),
                        ),
                        SizedBox(height: 0.11 * _size.width),
                        defaultPaddingWrapper(
                          size: _size,
                          child: headingWrapper(
                            title: 'TODAY\'S TASKS',
                            margin: 0.55 * _size.width,
                          ),
                        ),
                        ListView.builder(
                          // scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            return Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: defaultPaddingWrapper(
                                  size: _size,
                                  child: Container(
                                    child: Row(
                                      children: [
                                        SizedBox(width: 20),
                                        Icon(
                                          tasks[index].completed
                                              ? Icons.check_circle
                                              : Icons.circle_outlined,
                                          color: categoriesColors[
                                              tasks[index].category],
                                        ),
                                        SizedBox(width: 25),
                                        Text(
                                          tasks[index].name,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    constraints: BoxConstraints.tight(
                                      Size(
                                        MediaQuery.of(context).size.width *
                                            0.95,
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
                          itemCount: tasks.length,
                        ),
                      ],
                    );
                  }),
              SizedBox(height: 0.08 * _size.width),
              SizedBox(height: 0.1 * _size.width),
            ],
          ),
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
