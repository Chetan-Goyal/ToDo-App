import 'package:flutter/material.dart';
import 'package:todo_app/domain/task_repository/src/task_api_client.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: TaskApiClient().getTasks(),
            builder: (context, snapshot) {
              print(snapshot.data);
              if (!snapshot.hasData) return const Text("Home Screen");
              return Text(snapshot.data.toString());
            }),
      ),
    );
  }
}
