import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/core/styles/text_styles.dart';

class TaskPriorityWidget extends StatefulWidget {
  final List<String> listOfperiorts;

  const TaskPriorityWidget({super.key, required this.listOfperiorts});

  @override
  _TaskPriorityWidgetState createState() => _TaskPriorityWidgetState();
}

class _TaskPriorityWidgetState extends State<TaskPriorityWidget> {
  String? _selectedPeriorty;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.flag,
          color: ColorsManger.mediumColor,
          size: 25.0,
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: DropdownButton<String>(
            value: _selectedPeriorty,
            hint: Text(
              _selectedPeriorty ?? 'Select priority',
              style:
                  CustomstextStyels.font14ForMediumTasks.copyWith(fontSize: 20),
            ),
            onChanged: (String? newValue) {
              setState(() {
                _selectedPeriorty = newValue;
              });
            },
            items: widget.listOfperiorts
                .map<DropdownMenuItem<String>>((String taskPeriorty) {
              return DropdownMenuItem<String>(
                value: taskPeriorty,
                child: Text(
                  taskPeriorty,
                  style: CustomstextStyels.font14ForMediumTasks
                      .copyWith(fontSize: 20),
                ),
              );
            }).toList(),
            underline: Container(),
            isExpanded: true,
            icon: Image.asset(
              'assets/images/png/ArrowDown.png', // Custom image for dropdown icon
              width: 50.w, // Adjust width if needed
              height: 50.h, // Adjust height if needed
            ),
          ),
        ),
      ],
    );
  }
}
