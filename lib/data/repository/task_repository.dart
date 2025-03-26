import 'package:drutoloan_todo_task/data/models/task_info_model.dart';
import 'package:drutoloan_todo_task/data/sources/local_db.dart';

class TaskRepository {
  static Future<List<TaskInfoModel>> getTaskListRepo() async {
    List<TaskInfoModel> taskList = [];

    try {
      List todoJsonList = await LocalDb.getDbTodoTableList();

      for (var e in todoJsonList) {
        taskList.add(TaskInfoModel.fromJson(e));
      }
      print(taskList.length);
    } catch (e) {
      print(e);
    }
    return taskList;
  }

  static Future<void> addTaskToDb(TaskInfoModel taskModel) async {
    try {
      await LocalDb.dbInsertIntoTodoTable(
        title: taskModel.title!,
        description: taskModel.description!,
        created: taskModel.createdAt!,
        status: taskModel.status!,
      );
    } catch (e) {
      print(e);
    }
  }
}
