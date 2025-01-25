import 'package:flutter/material.dart';

class TaskPriorityWidget extends StatelessWidget {
  final List<String> listOfperiorts;
  final Function(String) onPrioritySelected;

  const TaskPriorityWidget({
    super.key,
    required this.listOfperiorts,
    required this.onPrioritySelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: listOfperiorts.first,
        onChanged: (value) {
          if (value != null) {
            onPrioritySelected(value);
          }
        },
        items: listOfperiorts.map((String priority) {
          return DropdownMenuItem<String>(
            value: priority,
            child: Text(priority),
          );
        }).toList(),
      ),
    );
  }
}
