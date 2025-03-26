import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:drutoloan_todo_task/presentation/controller/save_task_controller.dart';
import 'package:drutoloan_todo_task/presentation/widgets/app_widgets.dart';
import 'package:drutoloan_todo_task/themes/app_colors.dart' as appColor;
import 'package:drutoloan_todo_task/themes/text_style_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveTaskScreen extends StatelessWidget {
  SaveTaskScreen({super.key});

  DateTime date = DateTime.now();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final BoardDateTimeTextController dateController =
      BoardDateTimeTextController()..setDate(DateTime.now());
  final BoardDateTimeTextController timeController =
      BoardDateTimeTextController()..setDate(DateTime.now());

  final SaveTaskController taskController = Get.put(SaveTaskController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: appColor.AppColors.greyYellow,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(Icons.arrow_back_outlined, size: 30),
              ),
              InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    print(titleController.text);
                    print(detailsController.text);
                    print(dateController.selectedDate);
                    print(timeController.selectedDate);
                    print(taskController.selectedValue);
                  } else {}
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: appColor.AppColors.greyYellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text("Save Task", style: context.bodyMedium),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Task title", style: context.bodyLarge),
                TextFormField(
                  controller: titleController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "form cann't be empty";
                    }
                    return null;
                  },
                  style: TextStyle(fontSize: 16, color: Colors.green),
                  decoration: textFormInputDecoration("title"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Date", style: context.bodyLarge),

                        SizedBox(
                          width: 180,
                          child: BoardDateTimeInputField(
                            controller: dateController,
                            initialDate: DateTime.now(),
                            decoration: textFormInputDecoration(
                              "12/5/25",
                            ).copyWith(
                              suffixIcon: Icon(
                                Icons.calendar_month,
                                color: Colors.grey,
                              ),
                            ),

                            pickerType: DateTimePickerType.date,
                            options: BoardDateTimeOptions(
                              languages: BoardPickerLanguages.en(),
                              pickerFormat: PickerFormat.dmy,
                            ),
                            textStyle: context.titleMedium,
                            onChanged: (date) {
                              print('onchanged: $date');
                            },
                            onFocusChange: (val, date, text) {
                              print(
                                'on focus changed date: $val, $date, $text',
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Time", style: context.bodyLarge),

                        SizedBox(
                          width: 180,
                          child: BoardDateTimeInputField(
                            controller: timeController,
                            initialDate: DateTime.now(),
                            enabled: true,
                            decoration: textFormInputDecoration(
                              "${timeController.selectedDate}",
                            ).copyWith(
                              suffixIcon: Icon(
                                Icons.timer_outlined,
                                color: Colors.grey,
                              ),
                            ),

                            pickerType: DateTimePickerType.time,

                            options: BoardDateTimeOptions(
                              languages: BoardPickerLanguages.en(),
                              allowRetroactiveTime: true,
                            ),
                            textStyle: context.titleMedium,
                            onChanged: (date) {
                              print('onchanged: $date');
                            },
                            onFocusChange: (val, date, text) {
                              print(
                                'on focus changed date: $val, $date, $text',
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text("Details", style: context.bodyLarge),

                TextFormField(
                  controller: detailsController,
                  minLines: 6,
                  maxLines: 10,
                  expands: false,
                  keyboardType: TextInputType.multiline,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "form cann't be empty";
                    }
                    return null;
                  },
                  decoration: textFormInputDecoration("description"),
                ),
                Text("select your task Status", style: context.bodyMedium),
                GetBuilder<SaveTaskController>(
                  builder: (context) {
                    return Column(
                      children: [
                        RadioListTile(
                          title: Text('Ready'),
                          activeColor: appColor.AppColors.brownContainer,
                          contentPadding: EdgeInsets.zero,
                          value: 1,
                          groupValue: taskController.selectedValue,
                          onChanged: (value) {
                            taskController.status = {1: 'Ready'};
                            taskController.selectedValue = value!;
                            taskController.update();
                          },
                        ),
                        RadioListTile(
                          title: Text('Pending'),
                          activeColor: appColor.AppColors.pinkContainer,
                          contentPadding: EdgeInsets.zero,

                          value: 2,
                          groupValue: taskController.selectedValue,
                          onChanged: (value) {
                            taskController.status = {2: 'Pending'};
                            taskController.selectedValue = value!;
                            taskController.update();
                          },
                        ),
                        RadioListTile(
                          title: Text('Completed'),
                          activeColor: appColor.AppColors.greenAccentContainer,
                          contentPadding: EdgeInsets.zero,

                          value: 3,
                          groupValue: taskController.selectedValue,
                          onChanged: (value) {
                            taskController.status = {3: 'completed'};
                            taskController.selectedValue = value!;
                            taskController.update();
                          },
                        ),
                      ],
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
