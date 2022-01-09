import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/view/widgets/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  const RoundedPasswordField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (password) {
          if (password == null) return 'Please enter password to continue';

          if (password.length < 6) return 'Atleast 6 characters';
        },
        obscureText: true,
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: const InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
