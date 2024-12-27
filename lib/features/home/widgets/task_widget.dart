import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/core/styles/text_styles.dart';

class TaskWidget extends StatelessWidget {
  final String taskType;
  final String taskDescription;
  final String taskPriority;
  final String taskDueDate;
  final String taskBodyText;

  TaskWidget(
      {super.key,
      required this.taskType,
      required this.taskDescription,
      required this.taskPriority,
      required this.taskDueDate,
      required this.taskBodyText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add your click action here
        print("Task clicked");
      },
      child: Container(
        padding: EdgeInsets.all(8.0.dg),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0.dg),
          boxShadow: [
            BoxShadow(
              color: ColorsManger.myWhiteColor,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PNG Image
            Image.asset(
              "assets/images/png/cart.png",
              width: 50.w,
              height: 50.h,
            ),
            const SizedBox(width: 16.0), // Space between image and content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Status Badge
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        taskDescription,
                        style: CustomstextStyels.font15black700Wight,
                        maxLines: 1, // Limit to 1 line
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        width: 80.w,
                        height: 25.h,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: ColorsManger.myRedHavan,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Text(taskType,
                              style: CustomstextStyels.font14ForHihgtTasks),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0.h),
                  // Task Description
                  Text(taskBodyText,
                      style: CustomstextStyels.font20black700Wight),
                  SizedBox(height: 16.0.h),
                  // Metadata: Priority and Date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.flag,
                            color: ColorsManger.mediumColor,
                            size: 20.0,
                          ),
                          const SizedBox(width: 4.0),
                          Text(taskPriority,
                              style: CustomstextStyels.font14ForMediumTasks),
                        ],
                      ),
                      Text(
                        taskDueDate,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Additional Menu Icon

            Icon(
              Icons.more_vert,
              color: ColorsManger.customsGray,
            ),
          ],
        ),
      ),
    );
  }
}
