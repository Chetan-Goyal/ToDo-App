import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/config/constants.dart';
import 'package:todo_app/view/pages/authentication/signup/signup_screen.dart';
import 'package:todo_app/view/pages/onboarding/widgets/explore_now_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (_, prefs) {
        if (prefs.connectionState == ConnectionState.waiting)
          return const Scaffold();
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
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Cloud Sync',
                body: 'Access your tasks on any device',
                image: SvgPicture.asset("assets/images/onboarding/2-sync.svg"),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Easy to use',
                image: Image.asset(
                  "assets/images/onboarding/3-easy.png",
                  width: size.width,
                ),
                body:
                    'This app is completely ad-free, and helps in keeping track of progress without distractions',
                decoration: getPageDecoration(),
                footer: ExploreNowButton(prefs: prefs.data!),
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
            skipFlex: 0,
            nextFlex: 0,
            dotsDecorator: getDotDecoration(),
          ),
        );
      },
    );
  }

  PageDecoration getPageDecoration() {
    return PageDecoration(
      titleTextStyle:
          const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyTextStyle: const TextStyle(fontSize: 20),
      descriptionPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
      imagePadding: const EdgeInsets.all(24),
    );
  }

  DotsDecorator getDotDecoration() {
    return DotsDecorator(
      color: kPrimaryColor.withOpacity(0.5),
      activeColor: kPrimaryColor,
      size: const Size(10, 10),
      activeSize: const Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}
