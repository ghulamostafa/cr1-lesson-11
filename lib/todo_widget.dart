import 'package:flutter/material.dart';

class TodoWidget extends StatefulWidget {
  final int id;
  final String text;
  final Function onComplete;
  final bool completed;
  const TodoWidget(
      {super.key,
      required this.id,
      required this.text,
      required this.onComplete,
      required this.completed});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.id.toString(),
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Text(
          ':',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Switch(
          value: widget.completed,
          onChanged: (val) {
            widget.onComplete();
          },
        )
      ],
    );
  }
}
