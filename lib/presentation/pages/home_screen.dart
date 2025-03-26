import 'package:drutoloan_todo_task/presentation/controller/task_controller.dart';
import 'package:drutoloan_todo_task/presentation/widgets/custom_date_picker.dart';
import 'package:drutoloan_todo_task/presentation/widgets/task_container.dart';
import 'package:drutoloan_todo_task/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final taskController = TaskController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 10, right: 10),
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(Icons.arrow_back_outlined, size: 30),
              ),
              Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    Text("Add Task"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomDatePicker(),
            InkWell(
              onTap: () {
                taskController.getTaskList();
              },
              child: TaskContainer(containerColor: AppColors.brownContainer),
            ),
            InkWell(
              onTap: () {
                taskController.insertTask();
              },
              child: TaskContainer(containerColor: AppColors.pinkContainer),
            ),
            TaskContainer(containerColor: AppColors.greenAccentContainer),
          ],
        ),
      ),
    );
  }
}
