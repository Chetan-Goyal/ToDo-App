import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/config/locator.dart';
import 'package:todo_app/domain/auth_repository/auth_repository.dart';
import 'package:todo_app/view/pages/authentication/signup/signup_screen.dart';
import 'package:todo_app/view/pages/home/home_screen.dart';
import 'package:todo_app/view/pages/onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;

  bool isOnboardingCompleted = false;

  @override
  void initState() {
    super.initState();
    initialiseData();
  }

  initialiseData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = await const FlutterSecureStorage().read(key: 'accessToken');
    bool? initialised = prefs.getBool('Initialised');

    if (initialised == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => const OnboardingScreen(),
        ),
      );
    }

    if (token == null) {
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => const SignUpScreen(),
        ),
      );
    }

    bool result = await locator.get<AuthRepository>().validateToken(token);

    if (result)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomeScreen()));
    else
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => SignUpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
