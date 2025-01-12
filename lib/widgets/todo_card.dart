import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final bool completed;

  const TodoCard({super.key, required this.completed});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = completed ? Colors.white : Colors.black;
    final textColor = completed ? Colors.black : Colors.white;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    activeColor: Colors.black,
                    checkColor: Colors.black,
                    onChanged: (value) {},
                  ),
                  Text(
                    'TASK NAME',
                    style: TextStyle(color: textColor),
                  ),
                ],
              ),
              FilledButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(backgroundColor),
                    overlayColor:
                        WidgetStatePropertyAll(textColor.withAlpha(75))),
                onPressed: () {},
                child: Icon(Icons.delete_rounded, color: textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
