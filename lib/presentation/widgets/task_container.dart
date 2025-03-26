import 'package:drutoloan_todo_task/themes/text_style_ext.dart';
import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class TaskContainer extends StatelessWidget {
  final Color containerColor;
  const TaskContainer({super.key, required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 200,
          width: 300,
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("this is title", style: context.headMedium),
              Text("Follow me on social media", style: context.titleMedium),
              Text("12:08 pm", style: context.headMedium),
            ],
          ),
        ),
        Container(
          height: 200,
          width: 90,
          // margin: EdgeInsets.symmetric(horizontal: , vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.brownContainer,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: double.maxFinite,
            color: Colors.orange,
            child: RotatedBox(
              // angle: -math.pi / 2,
              // alignment: Alignment.center,
              // transformHitTests: false,
              quarterTurns: -1,
              child: Center(
                child: Container(
                  color: Colors.green,
                  child: Text("Rotated", style: context.headMedium),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
