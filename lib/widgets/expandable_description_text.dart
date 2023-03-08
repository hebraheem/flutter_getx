import 'package:flutter/material.dart';
import 'package:get_x/widgets/test_widgets.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class ExpandableDescriptionText extends StatefulWidget {
  final String text;
  const ExpandableDescriptionText({super.key, required this.text});

  @override
  State<ExpandableDescriptionText> createState() =>
      _ExpandableDescriptionTextState();
}

class _ExpandableDescriptionTextState extends State<ExpandableDescriptionText> {
  late String firstHalfText;
  late String secondHalfText;
  bool hiddenText = true;
  double textHeight = Dimensions.deviceHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalfText = widget.text.substring(0, textHeight.toInt());
      secondHalfText =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalfText = widget.text;
      secondHalfText = "";
      hiddenText = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalfText.isEmpty
          ? SmallText(text: firstHalfText)
          : Column(
              children: [
                SmallText(
                  text: hiddenText
                      ? ("$firstHalfText...")
                      : firstHalfText + secondHalfText,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(
                          text: hiddenText ? "show more" : "show less",
                          color: AppColor.mainColor),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColor.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
