import 'package:flutter/material.dart';
import 'package:get_x/utils/dimensions.dart';

class IconWidget extends StatelessWidget {
  final Color? color;
  final IconData icon;
  final double? size;
  final Color? backgroundColor;

  const IconWidget({
    super.key,
    this.color = const Color(0xff756d54),
    required this.icon,
    this.size = 0,
    this.backgroundColor = const Color(0xfffcf4e4),
  });

  @override
  Widget build(BuildContext context) {
    final sx =
        size! == 0 ? (Dimensions.height20 * 2) + Dimensions.height5 : size;
    return Center(
      child: Container(
        width: sx,
        height: sx,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(sx! / 2)),
        child: Icon(
          icon,
          color: color,
          size: sx / 2,
        ),
      ),
    );
  }
}
