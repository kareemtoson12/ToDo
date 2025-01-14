import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/core/styles/text_styles.dart';

import 'package:tasky/features/addTask/widgets/add_images.dart';
import 'package:tasky/features/addTask/widgets/add_task_button.dart';
import 'package:tasky/features/addTask/widgets/add_task_header.dart';
import 'package:tasky/features/addTask/widgets/date_widget.dart';
import 'package:tasky/features/addTask/widgets/piriorty_widget.dart';
import 'package:tasky/features/addTask/widgets/title_and_description.dart';
import 'package:tasky/features/task_details/widgets/task_status_periorty.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime? _selectedDate;
  final List<String> _periortyOptions = [
    'low',
    'medium',
    'high',
  ];
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0.dm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //header
                AddTaskHeader(),
                SizedBox(
                  height: 20.h,
                ),
                //add image container
                AddImages(),
                SizedBox(
                  height: 25.h,
                ),
                //add title for task
                TitleAndDsecreptionWidget(),
                SizedBox(
                  height: 25.h,
                ),
                // priority selection

                Text(
                  'priority',
                  style: CustomstextStyels.font15grayBoldWight,
                ),
                SizedBox(
                  height: 5.h,
                ),
                statusDropDown(
                    TaskPriorityWidget(listOfperiorts: _periortyOptions)),

// Date Picker
                SizedBox(
                  height: 25.h,
                ),
                DatePickerWidget(
                  onDateSelected: (DateTime date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                //submit button
                AddTaskButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
