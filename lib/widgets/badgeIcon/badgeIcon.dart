import 'package:flutter/material.dart';

import '../../constant/color.dart';

class BadgeIconButton extends StatelessWidget {
  final Icon icon;
  final int badgeCount;

  const BadgeIconButton({
    required this.icon,
    required this.badgeCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        icon,
        Positioned(
          right: -1,
          top: -6,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: colorHelper.colors[3],
              shape: BoxShape.circle,
            ),
            child: Text(
              badgeCount.toString(),
              style: TextStyle(color: colorHelper.colors[1], fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
