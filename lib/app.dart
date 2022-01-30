import 'package:flutter/material.dart';
import 'package:todo_app/view/pages/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SplashScreen());
  }
}
