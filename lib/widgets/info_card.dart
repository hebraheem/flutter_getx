import 'package:flutter/material.dart';
import 'package:get_x/widgets/icon_text.dart';
import 'package:get_x/widgets/test_widgets.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class InfoCard extends StatelessWidget {
  final String text;
  const InfoCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: Dimensions.height15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: text),
          SizedBox(height: Dimensions.height10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                children: List.generate(
                    5,
                    (index) => Icon(Icons.star,
                        color: AppColor.mainColor, size: Dimensions.height20)),
              ),
              SizedBox(width: Dimensions.width10),
              SmallText(text: "2.5"),
              SizedBox(width: Dimensions.width10),
              SmallText(text: "4569"),
              SizedBox(width: Dimensions.width10),
              SmallText(text: "comments"),
              SizedBox(height: Dimensions.height20),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColor.iconColor1,
              ),
              IconText(
                icon: Icons.location_on,
                text: "1.7km",
                iconColor: AppColor.mainColor,
              ),
              IconText(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: AppColor.iconColor2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
