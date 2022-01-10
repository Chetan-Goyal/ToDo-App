import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/view/pages/authentication/signup/signup_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (_, prefs) {
        if (!prefs.hasData) return const Scaffold();
        if (prefs.data!.containsKey('Initialised')) return const SignUpScreen();

        return SafeArea(
          child: IntroductionScreen(
            pages: [
              PageViewModel(
                title: 'Lost track of your tasks?',
                image: Image.asset(
                  "assets/images/onboarding/1-tasks.png",
                  width: size.width,
                ),
                body: 'Track all of your tasks with our App',
              ),
              PageViewModel(
                title: 'Cloud Sync',
                body: 'Access your tasks on any device',
                image: SvgPicture.asset("assets/images/onboarding/2-sync.svg"),
              ),
              PageViewModel(
                title: 'Easy to use',
                image: Image.asset(
                  "assets/images/onboarding/3-easy.jpg",
                  width: size.width,
                ),
                body:
                    'This app is completely ad-free, and helps in keeping track of progress without distractions',
                footer: ElevatedButton(
                  onPressed: () {
                    prefs.data!.setBool('Initialised', true);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const SignUpScreen()),
                    );
                  },
                  child: const Text('Explore Now!'),
                  style: ElevatedButton.styleFrom(
                    shadowColor: kPrimaryColor,
                    onPrimary: Colors.white,
                    onSurface: kPrimaryColor,
                    primary: kPrimaryColor,
                  ),
                ),
              )
            ],
            done: const FittedBox(child: Text('Explore')),
            doneColor: kPrimaryColor,
            color: kPrimaryColor,
            onDone: () {
              prefs.data!.setBool('Initialised', true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const SignUpScreen()),
              );
            },
            showNextButton: true,
            next: const Text('Next'),
            skip: const Text('Skip'),
            showSkipButton: true,
            dotsFlex: 5,
          ),
        );
      },
    );
  }
}
