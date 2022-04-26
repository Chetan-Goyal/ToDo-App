import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/domain/auth_repository/src/auth_api_client.dart';
import 'package:todo_app/view/pages/authentication/login/login_screen.dart';
import 'package:todo_app/view/pages/authentication/signup/widgets/background.dart';
import 'package:todo_app/view/pages/authentication/widgets/already_have_an_account_acheck.dart';
import 'package:todo_app/view/pages/authentication/signup/widgets/rounded_button.dart';
import 'package:todo_app/view/pages/authentication/signup/widgets/rounded_input_field.dart';
import 'package:todo_app/view/pages/authentication/signup/widgets/rounded_password_field.dart';
import 'package:todo_app/view/pages/home/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
                  "SIGNUP",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/signup.svg",
                  height: size.height * 0.35,
                ),
                RoundedInputField(
                  hintText: "Your Username",
                  controller: usernameController,
                  validator: (String? username) {
                    if (username == null) return 'Username is required!!!';
                    if (username.length < 6) {
                      return 'Username should be 6 or more characters';
                    }
                    return null;
                  },
                ),
                RoundedInputField(
                  hintText: "Your Email",
                  controller: emailController,
                  validator: (String? email) {
                    if (!EmailValidator.validate(email ?? "")) {
                      return 'Invalid Email Address';
                    }
                    return null;
                  },
                ),
                RoundedPasswordField(
                  controller: passwordController,
                ),
                RoundedButton(
                  text: "SIGNUP",
                  press: () async {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      bool result = await AuthApiClient().register(
                        usernameController.text,
                        emailController.text,
                        passwordController.text,
                      );
                      if (result) {
                        Navigator.pushAndRemoveUntil(
                          context,
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
                  login: false,
                  press: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => LoginScreen(),
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
