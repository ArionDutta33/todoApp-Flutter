import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class todoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  void Function(bool?)? onChange;
  void Function(BuildContext)? delete;
  todoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChange,
      required this.delete});
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: delete,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow[500],
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              Checkbox(
                  activeColor: Colors.black,
                  value: taskCompleted,
                  onChanged: onChange),
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
