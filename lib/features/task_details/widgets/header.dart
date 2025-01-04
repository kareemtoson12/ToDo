import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/core/styles/text_styles.dart';

class Taskdetailsheader extends StatelessWidget {
  const Taskdetailsheader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
              print('Edit task');
              // Add navigation or logic for editing the task
            } else if (value == 'delete') {
              print('Delete task');
              // Add logic for deleting the task
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
    );
  }
}
