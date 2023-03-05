import 'package:flutter/material.dart';
import 'package:get_x/components/home/food_page_body.dart';
import 'package:get_x/utils/colors.dart';
import 'package:get_x/widgets/test_widgets.dart';
import 'package:get_x/utils/dimensions.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            // ignore: avoid_unnecessary_containers
            child: Container(
              margin: EdgeInsets.only(
                  top: (Dimensions.height20) * 2 + Dimensions.height5,
                  bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: "Nigeria",
                        color: AppColor.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(text: "City"),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: (Dimensions.width20) * 2 + Dimensions.width20,
                      height: (Dimensions.height20) * 2 + Dimensions.height5,
                      decoration: BoxDecoration(
                        color: AppColor.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.height15),
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const FoodPageBody(),
        ],
      ),
    );
  }
}
