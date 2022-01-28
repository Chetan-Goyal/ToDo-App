import 'package:flutter/material.dart';
import 'package:todo_app/domain/task_repository/task_repository.dart';
import 'package:todo_app/domain/task_repository/src/task_api_client.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
              child: Text('What\'s up, Chetan!'),
            ),
            SizedBox(height: 0.11 * _size.width),
            defaultPaddingWrapper(size: _size, child: Text('CATEGORIES')),
            SizedBox(height: 0.08 * _size.width),
            SizedBox(
              // width: double.infinity,
              height: 90,
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      constraints: BoxConstraints.tight(
                          // minHeight: 40,
                          Size(170, 90)
                          // maxHeight: 40,
                          // // minWidth: 20,
                          // maxWidth: 60,
                          ),
                      color: Colors.yellow,
                      // child: Card(
                      //   color: Colors.red,
                      //   elevation: 5,
                      //   shadowColor: Colors.blue,
                      // ),
                    ),
                  );
                },
                itemCount: 40,
              ),
            ),
            SizedBox(height: 0.1 * _size.width),
            // defaultPaddingWrapper(
            //   size: _size,
            //   child: FutureBuilder<List<TaskModel>>(
            //       future: TaskApiClient().getTasks(),
            //       builder: (context, snapshot) {
            //         print(snapshot.data);
            //         if (!snapshot.hasData) {
            //           return const CircularProgressIndicator();
            //         }
            //         return ListView.builder(
            //           itemBuilder: (ctx, index) {
            //             return Card(
            //               child: Text(
            //                 snapshot.data![index].name,
            //                 style: const TextStyle(fontSize: 30),
            //               ),
            //             );
            //           },
            //           itemCount: snapshot.data!.length,
            //         );
            //       }),
            // ),
          ],
        ),
      ),
    );
  }

  defaultPaddingWrapper({required Widget child, required Size size}) {
    return Padding(
      padding: EdgeInsets.all(0.08 * size.width),
      child: child,
    );
  }
}
