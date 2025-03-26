import 'package:drutoloan_todo_task/data/sources/local_db.dart';
import 'package:drutoloan_todo_task/presentation/pages/save_task_screen.dart';
import 'package:drutoloan_todo_task/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDb().initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'drutoLoan todo',
      theme: AppTheme.lightTheme,
      home: SaveTaskScreen(),
    );
  }
}
