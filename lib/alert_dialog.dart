import 'package:flutter/material.dart';
import 'package:todo/buttons.dart';

class AlertBox extends StatelessWidget {
  final TextEditingController dialogController;
  VoidCallback onSave;
  VoidCallback onCancel;
  AlertBox(
      {super.key,
      required this.dialogController,
      required this.onCancel,
      required this.onSave});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            TextField(
              controller: dialogController,
              decoration: const InputDecoration(
                hintText: "Add a new task",
                border: OutlineInputBorder(),
              ),
            ),

            //button save and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                const SizedBox(
                  width: 20,
                ),
                MyButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
