import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/domain/auth_repository/src/auth_api_client.dart';
import 'package:todo_app/view/pages/authentication/signup/signup_screen.dart';
import 'package:todo_app/view/pages/home/home_screen_new.dart';
import 'package:todo_app/view/pages/authentication/widgets/already_have_an_account_acheck.dart';
import 'package:todo_app/view/pages/authentication/signup/widgets/rounded_button.dart';
import 'package:todo_app/view/pages/authentication/signup/widgets/rounded_input_field.dart';
import 'package:todo_app/view/pages/authentication/signup/widgets/rounded_password_field.dart';
import 'widgets/background.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  controller: usernameController,
                  validator: (String? username) {
                    if (username == null || username == "") {
                      return 'Username is required';
                    }
                    if (username.length < 6) {
                      return "Invalid Username";
                    }
                    return null;
                  },
                  hintText: "Your Username",
                ),
                RoundedPasswordField(
                  controller: passwordController,
                ),
                RoundedButton(
                  text: "LOGIN",
                  press: () async {
                    final navigator = Navigator.of(context);
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      bool result = await AuthApiClient().login(
                        usernameController.text,
                        passwordController.text,
                      );
                      if (result) {
                        navigator.pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (ctx) => const HomeScreen(),
                          ),
                          (_) => true,
                        );
                      } else {
                        // Todo: Show Toast for error
                      }
                    } else {}
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => const SignUpScreen(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: const Duration(milliseconds: 200),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
