import 'package:flutter/material.dart';

Future<DateTime?> selectDate(BuildContext context,
    [DateTime? selectedDate]) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate ?? DateTime.now(),
    initialDatePickerMode: DatePickerMode.day,
    firstDate: DateTime.now(),
    lastDate: DateTime(DateTime.now().year + 10),
  );
  return picked;
}
