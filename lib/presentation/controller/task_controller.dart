import 'package:drutoloan_todo_task/data/models/task_info_model.dart';
import 'package:drutoloan_todo_task/data/repository/task_repository.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  List taskList = [];

  int selectedValue = 1;

  @override
  onReady() {
    // insertTask();
    getTaskList();
    super.onReady();
  }

  getData() {
    print("hi");
  }

  getTaskList() async {
    print("getting info");
    taskList = await TaskRepository.getTaskListRepo();
    print(taskList);
  }

  insertTask() async {
    var taskModel = TaskInfoModel(
      id: 1,
      title: "title",
      description: "des",
      createdAt: "created at",
      status: "status",
    );
    for (int i = 0; i <= 1; i++) {
      await TaskRepository.addTaskToDb(taskModel);
    }
  }
}
