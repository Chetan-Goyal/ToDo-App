import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/config/constants.dart';
import 'package:todo_app/view/pages/authentication/signup/signup_screen.dart';

class ExploreNowButton extends StatelessWidget {
  const ExploreNowButton({
    Key? key,
    required this.prefs,
  }) : super(key: key);

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        prefs.setBool('Initialised', true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SignUpScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(
            color: kPrimaryColor.withOpacity(0.4),
            width: 2.0,
          ),
        ),
        shadowColor: kPrimaryColor,
        onPrimary: Colors.white,
        onSurface: kPrimaryColor,
        primary: kPrimaryColor.withOpacity(0.8),
      ),
      child: const Text('Explore Now!'),
    );
  }
}
