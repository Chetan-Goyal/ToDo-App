import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/view/widgets/components/already_have_an_account_acheck.dart';
import 'package:todo_app/view/widgets/components/rounded_button.dart';
import 'package:todo_app/view/widgets/components/rounded_input_field.dart';
import 'package:todo_app/view/widgets/components/rounded_password_field.dart';
import 'widgets/background.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

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
                  controller: emailController,
                  validator: (String? email) {
                    if (!EmailValidator.validate(email ?? "")) {
                      return "Invalid Email Address";
                    }
                  },
                  hintText: "Your Email",
                ),
                RoundedPasswordField(
                  controller: passController,
                ),
                RoundedButton(
                  text: "LOGIN",
                  press: () {
                    if (_formKey.currentState == null) {
                    } else if (_formKey.currentState!.validate())
                      print("Validated");
                    else
                      print("Not Validated");
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Container(); //SignUpScreen();
                        },
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
