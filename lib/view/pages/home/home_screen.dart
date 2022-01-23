import 'package:flutter/material.dart';
import 'package:todo_app/domain/task_repository/task_repository.dart';
import 'package:todo_app/domain/task_repository/src/task_api_client.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<TaskModel>>(
              future: TaskApiClient().getTasks(),
              builder: (context, snapshot) {
                print(snapshot.data);
                if (!snapshot.hasData) return const CircularProgressIndicator();
                return ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Text(
                        snapshot.data![index].name,
                        style: const TextStyle(fontSize: 30),
                      ),
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              }),
        ),
      ),
    );
  }
}
