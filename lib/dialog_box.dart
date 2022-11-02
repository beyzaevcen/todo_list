import 'package:flutter/material.dart';
import 'package:to_do_new/my_button.dart';

class DialogBox extends StatelessWidget{
  DialogBox({required this.controller,required this.onCancel,required this.onSave});
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
  return AlertDialog(
    backgroundColor: Colors.orangeAccent[100],
    content: Container(
        height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: controller,
            decoration:InputDecoration(
                border: OutlineInputBorder(),
              hintText: "Add a new ToDo task honey."
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //save but
              MyButton(
                  onPressed: onSave ,
                  text:"Save",
              ),
SizedBox(width: 12),
              //cancel but
              MyButton(
                  onPressed: onCancel,
                  text:"Cancel"
              )
            ],
          )
        ],
      ),
    ),
  );
  }

}