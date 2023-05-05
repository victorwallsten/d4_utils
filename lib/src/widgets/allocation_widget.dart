import 'package:flutter/material.dart';

class AllocationWidget extends StatelessWidget {
  const AllocationWidget(
    this.skill, {
    super.key,
    required this.level,
    this.onMinusPressed,
    this.onPlusPressed,
  });

  final Enum skill;
  final int level;
  final VoidCallback? onMinusPressed;
  final VoidCallback? onPlusPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onMinusPressed,
          icon: const Icon(
            Icons.remove,
          ),
        ),
        Text(level.toString()),
        IconButton(
          onPressed: onPlusPressed,
          icon: const Icon(
            Icons.add,
          ),
        ),
      ],
    );
  }
}
