import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/features/home/cubit/home_cubit.dart';

class Taskdetailsheader extends StatelessWidget {
  final String taskId;

  const Taskdetailsheader({
    super.key,
    required this.taskId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is DeleteTaskSuccess) {
          // Show a success message and navigate back
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Task deleted successfully.')),
            //navigato to home
          );
          Navigator.pushReplacementNamed(context, Routes.home);
        } else if (state is DeleteTaskError) {
          // Show an error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Row(
        children: [
          // Back arrow SVG
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset(
              'assets/images/svg/arrow_left.svg',
            ),
          ),
          SizedBox(width: 24.w),
          // Title
          Text(
            'Task Details',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(), // Pushes the icon to the end
          // Popup Menu Button
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onSelected: (String value) {
              // Handle menu item selection
              if (value == 'edit') {
                // Add logic for editing the task
                print('Edit task');
              } else if (value == 'delete') {
                // Confirm deletion before proceeding
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Delete Task'),
                      content:
                          Text('Are you sure you want to delete this task?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close dialog
                            context.read<HomeCubit>().deleteTask(taskId);
                          },
                          child: Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'edit',
                  child: Text(
                    'Edit',
                    style: CustomstextStyels.font15black700Wight,
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'delete',
                  child: Text(
                    'Delete',
                    style: CustomstextStyels.font14ForHihgtTasks
                        .copyWith(fontSize: 20),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
