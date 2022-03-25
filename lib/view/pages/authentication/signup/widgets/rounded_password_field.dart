import 'package:flutter/material.dart';
import 'package:todo_app/config/constants.dart';
import 'package:todo_app/view/pages/authentication/signup/widgets/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final TextEditingController controller;
  const RoundedPasswordField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscuredPass = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (password) {
          if (password == null) return 'Please Enter a valid password!!!';

          if (password.length < 6) return 'Atleast 6 characters';

          return null;
        },
        obscureText: _obscuredPass,
        controller: widget.controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscuredPass = !_obscuredPass;
              });
            },
            icon: const Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
