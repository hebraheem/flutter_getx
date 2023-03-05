import 'package:flutter/material.dart';
import 'package:get_x/widgets/test_widgets.dart';
import 'package:get_x/utils/dimensions.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  double? iconSize;

  IconText(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor,
      this.iconSize = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon,
            color: iconColor,
            size: iconSize == 0 ? Dimensions.icon24 : iconSize),
        const SizedBox(width: 5),
        SmallText(
          text: text,
        )
      ],
    );
  }
}
