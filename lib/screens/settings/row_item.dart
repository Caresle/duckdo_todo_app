import 'package:duckdo_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const RowItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: 4),
            Text(text),
          ],
        ),
        CustomSwitch(value: true),
      ]),
    );
  }
}
