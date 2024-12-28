import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/features/home/widgets/add_task.dart';
import 'package:tasky/features/home/widgets/filter_tasks.dart';
import 'package:tasky/features/home/widgets/home_header.dart';
import 'package:tasky/features/home/widgets/task_widget.dart';
import 'package:tasky/features/home/cubit/home_cubit.dart';
import 'package:tasky/features/home/data/models/get_tasks.response.dart';

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
                // Home header widget
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
                // Filter tasks widget
                Row(
                  children: [FilterTasks()],
                ),

                // Tasks list
                SizedBox(
                  height: 10.h,
                ),
                BlocListener<HomeCubit, HomeState>(
                  listener: (context, state) {
                    if (state is GetTasksError) {
                      // Show error if there's an error fetching tasks
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is GetTasksLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is GetTasksEmpty) {
                        return Center(child: Text("No tasks available."));
                      } else if (state is GetTasksError) {
                        return Center(child: Text(state.message));
                      } else if (state is GetTasksSuccess) {
                        // Render task widgets based on the tasks list
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.tasks.length,
                          itemBuilder: (context, index) {
                            GetTasksResponse task = state.tasks[index];
                            return TaskWidget(
                              taskDescription: task.title ?? 'No Title',
                              taskBodyText: task.desc ?? 'No Description',
                              taskDueDate: task.createdAt ?? formattedDate,
                              taskPriority: task.priority ?? 'Medium',
                              taskType: task.status ?? 'Pending',
                            );
                          },
                        );
                      }
                      return Container(); // Return empty if state is unhandled
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Get current date without time
DateTime now = DateTime.now();
DateTime today = DateTime(now.year, now.month, now.day);
String formattedDate = DateFormat('yyyy-MM-dd').format(today);
