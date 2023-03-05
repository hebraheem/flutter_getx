import 'package:flutter/material.dart';
import 'package:get_x/utils/dimensions.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  int maxLines;
  TextOverflow overflow;

  BigText({
    Key? key,
    this.color = const Color(0xff332d2b),
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 0,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        overflow: overflow,
        fontSize: size != 0 ? size : Dimensions.height20,
        fontWeight: FontWeight.w400,
        fontFamily: "Roboto",
      ),
    );
  }
}

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;

  SmallText(
      {Key? key,
      this.color = const Color(0xFFccc7c5),
      required this.text,
      this.size = 12,
      this.height = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        height: height,
        fontFamily: "Roboto",
      ),
    );
  }
}
