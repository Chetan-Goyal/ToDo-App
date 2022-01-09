import 'package:flutter/material.dart';
import 'package:todo_app/view/pages/authentication/login/login_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen());
  }
}
