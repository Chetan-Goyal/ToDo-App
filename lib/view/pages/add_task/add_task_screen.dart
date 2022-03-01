import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/domain/task_repository/src/task_api_client.dart';
import 'package:todo_app/view/pages/add_task/widgets/date_picker.dart';
import 'package:todo_app/utils/date_utils.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final controller = TextEditingController();

  DateTime? dateTime;
  Color? color;

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
                        // left: 15,
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
                          DateTime? _dateTime =
                              await selectDate(context, dateTime);
                          if (_dateTime != null) {
                            dateTime = _dateTime;
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
                              const SizedBox(width: 10),
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
                                // child: ColorPicker(
                                //   pickerColor: Colors.blue,
                                //   onColorChanged: (_) {},
                                // ),
                                // Use Material color picker:
                                //
                                // child: MaterialPicker(
                                //   pickerColor: Colors.blue,
                                //   onColorChanged: (_) {},
                                //   enableLabel: true, // only on portrait mode
                                // ),
                                //
                                // Use Block color picker:
                                //
                                child: BlockPicker(
                                  pickerColor: Colors.blue,
                                  onColorChanged: (_) {},
                                ),
                                //
                                // child: MultipleChoiceBlockPicker(
                                //   pickerColors: currentColors,
                                //   onColorsChanged: changeColors,
                                // ),
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
                            children: const [
                              Icon(
                                Icons.circle_outlined,
                                size: 25,
                              ),
                              Icon(
                                Icons.circle,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.create_new_folder_outlined),
                  Icon(Icons.flag_outlined),
                  Icon(Icons.nightlight_outlined),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  bool result =
                      await TaskApiClient().addTask(controller.text, null);
                  if (result) Navigator.pop(context, result);
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
    if (date == null) return 'Today';
    if (date.isToday) return 'Today';
    if (date.isTomorrow) return 'Tomorrow';

    return DateFormat.MMMd().format(date);
  }
}
