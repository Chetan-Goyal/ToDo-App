import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/config/locator.dart';
import 'package:todo_app/domain/auth_repository/auth_repository.dart';
import 'package:todo_app/view/pages/authentication/signup/signup_screen.dart';
import 'package:todo_app/view/pages/home/home_screen_new_logic.dart';
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
    final navigator = Navigator.of(context);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = await const FlutterSecureStorage().read(key: 'accessToken');
    bool? initialised = prefs.getBool('Initialised');

    if (initialised == null) {
      return navigator.pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const OnboardingScreen(),
        ),
      );
    }

    if (token == null) {
      return navigator.pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const SignUpScreen(),
        ),
      );
    }

    bool result = await locator.get<AuthRepository>().validateToken(token);

    if (result) {
      navigator.pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      navigator.pushReplacement(
        MaterialPageRoute(builder: (_) => const SignUpScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Image.asset("assets/images/onboarding/bg.png").color,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding/bg.png"),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.low,
            opacity: 1,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                'assets/icons/logo.png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              const Spacer(flex: 2),
              const SpinKitFadingCube(
                color: Color.fromRGBO(254, 247, 232, 1),
                duration: Duration(milliseconds: 3000),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
