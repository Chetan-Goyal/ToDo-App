import 'package:flutter/material.dart';
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
                    Icon(Icons.menu, size: 0.09 * _size.width),
                    const Spacer(),
                    Icon(Icons.search, size: 0.09 * _size.width),
                    SizedBox(width: 0.05 * _size.width),
                    Icon(Icons.notifications, size: 0.09 * _size.width),
                  ],
                ),
              ),
              SizedBox(height: 0.1 * _size.width),
              defaultPaddingWrapper(
                size: _size,
                child: const Text('What\'s up, Chetan!'),
              ),
              SizedBox(height: 0.11 * _size.width),
              defaultPaddingWrapper(
                  size: _size, child: const Text('CATEGORIES')),
              FutureBuilder<List<TaskModel>>(
                  future: locator.get<TaskRepository>().getTasks(),
                  builder: (ctx, snapshot) {
                    // print(snapshot);
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const CircularProgressIndicator();
                    }

                    Set<String> categories = <String>{};
                    for (var task in snapshot.data!) {
                      print(task.runtimeType);
                      print(task);
                      categories.add(task.category);
                    }
                    print(categories);

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 90,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  constraints:
                                      BoxConstraints.tight(const Size(170, 90)),
                                  color: Colors.yellow,
                                ),
                              );
                            },
                            itemCount: categories.length,
                          ),
                        ),
                        SizedBox(height: 0.11 * _size.width),
                        defaultPaddingWrapper(
                          size: _size,
                          child: Text('Today\'s Tasks'),
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
                                    constraints: BoxConstraints.tight(
                                        const Size(170, 90)),
                                    color: Colors.yellow,
                                  ),
                                ));
                          },
                          itemCount: categories.length,
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
}
