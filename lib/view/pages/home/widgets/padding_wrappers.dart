import 'package:flutter/material.dart';
import 'package:todo_app/config/constants.dart';

defaultPaddingWrapper({required Widget child, required Size size}) {
  return Padding(
    padding: EdgeInsets.only(left: 0.08 * size.width, right: 0.08 * size.width),
    child: child,
  );
}

headingWrapper({required String title, required double margin}) {
  return Padding(
    padding: EdgeInsets.only(right: margin),
    child: FittedBox(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: lightGreyColor,
          fontSize: 48,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}
