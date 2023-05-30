import 'package:flutter/material.dart';

class AllocationWidget extends StatelessWidget {
  const AllocationWidget(
    this.skill, {
    super.key,
    required this.level,
    required this.maxAssignedLevel,
    required this.onPressed,
    required this.onLongPress,
    required this.color,
  });

  final Enum skill;
  final int level;
  final int maxAssignedLevel;
  final VoidCallback onPressed;
  final VoidCallback onLongPress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: Text(
        '$level/$maxAssignedLevel',
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
