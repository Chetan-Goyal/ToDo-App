import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: const FlutterSecureStorage().read(key: 'accessToken'),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text("Home Screen");
              return Text(snapshot.data.toString());
            }),
      ),
    );
  }
}
