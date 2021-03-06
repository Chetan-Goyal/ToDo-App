import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/config/constants.dart';
import 'package:todo_app/domain/task_repository/src/task_api_client.dart';
import 'package:todo_app/view/pages/add_task/widgets/date_picker.dart';
import 'package:todo_app/utils/date_utils.dart';

import 'widgets/icon_button.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final controller = TextEditingController();
  final categoryController = TextEditingController();

  DateTime? dateTime;
  Color? color;
  bool isImportant = false;
  bool isReminderSet = false;
  String? category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40.0,
            bottom: 40.0,
            left: 40.0,
            right: 35.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 33,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter new Task',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: 11,
                        top: 11,
                        right: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          DateTime? prevDateTime =
                              await selectDate(context, dateTime);
                          if (prevDateTime != null) {
                            dateTime = prevDateTime;
                            setState(() {});
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                color: Colors.black,
                                size: 25,
                              ),
                              if (dateTime != null) const SizedBox(width: 10),
                              Text(formatDate(dateTime))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Pick a color!'),
                              content: SingleChildScrollView(
                                child: BlockPicker(
                                  pickerColor: Colors.black,
                                  onColorChanged: (newColor) {
                                    color = newColor;
                                    setState(() {});
                                  },
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Got it'),
                                  onPressed: () {
                                    // setState(() => currentColor = pickerColor);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.circle_outlined,
                                color: color ?? Colors.black,
                                size: 25,
                              ),
                              Icon(
                                Icons.circle,
                                color: color ?? Colors.black,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final result = await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Category for your task"),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                              contentPadding: const EdgeInsets.only(top: 10.0),
                              actionsAlignment: MainAxisAlignment.center,
                              actions: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      category = categoryController.text;
                                    });
                                    Navigator.of(context).pop(true);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 15.0, bottom: 15.0),
                                    decoration: const BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30.0),
                                      ),
                                    ),
                                    width: 150,
                                    child: const Text(
                                      "Update",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                              content: Container(
                                width: 300.0,
                                margin: const EdgeInsets.all(20),
                                child: TextFormField(
                                  controller: categoryController,
                                  decoration: const InputDecoration(
                                    hintText: "Category",
                                  ),
                                ),
                              ),
                            );
                          });

                      if (result == null || !result) {
                        setState(() {
                          categoryController.text = category ?? '';
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.create_new_folder_outlined,
                            color: Colors.black,
                            size: 25,
                          ),
                          if (category != null) ...[
                            const SizedBox(width: 10),
                            Text(category!),
                          ]
                        ],
                      ),
                    ),
                  ),
                  ToggleIconButton(
                    icon: Icons.flag_outlined,
                    callback: () => setState(() {
                      isImportant = !isImportant;
                    }),
                    isSelected: isImportant,
                  ),
                  ToggleIconButton(
                    icon: Icons.alarm,
                    callback: () => setState(() {
                      isReminderSet = !isReminderSet;
                    }),
                    isSelected: isReminderSet,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  final navigator = Navigator.of(context);
                  bool result = await TaskApiClient().addTask(
                    name: controller.text,
                    category: category,
                    color: color,
                    isImportant: isImportant,
                    isReminderSet: isReminderSet,
                    deadline: dateTime,
                  );
                  if (result) navigator.pop(result);
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('New Task'),
                        SizedBox(width: 10),
                        Icon(Icons.keyboard_arrow_up_rounded)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatDate(DateTime? date) {
    if (date == null) return '';
    if (date.isToday) return 'Today';
    if (date.isTomorrow) return 'Tomorrow';

    return DateFormat.MMMd().format(date);
  }
}
