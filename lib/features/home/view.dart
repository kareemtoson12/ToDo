import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/features/home/widgets/add_task.dart';
import 'package:tasky/features/home/widgets/filter_tasks.dart';
import 'package:tasky/features/home/widgets/home_header.dart';
import 'package:tasky/features/home/widgets/task_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddTaskWidget(),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(13.0.dg),
          child: Column(
            children: [
              //home header widget
              Homeheader(),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Text(
                    'My Tasks',
                    style: CustomstextStyels.font20grayBoldWight,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              //filter tasks widget
              Row(
                children: [FilterTasks()],
              ),

              //tasks list
              SizedBox(
                height: 10.h,
              ),
              TaskWidget(
                taskDescription: 'Grocery Shopping App',
                taskBodyText:
                    'This application is designed for shopping tasks.',
                taskDueDate: formattedDate, //+
                taskPriority: 'Medium',
                taskType: 'Wating',
              ),
            ],
          ),
        ),
      )),
    );
  }
}

//get date withot time
DateTime now = DateTime.now();
DateTime today = DateTime(now.year, now.month, now.day);
String formattedDate = DateFormat('yyyy-MM-dd').format(today);
