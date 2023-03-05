import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/controllers/tap_controller.dart';
import 'package:get_x/pages/first_page.dart';
import 'package:get_x/pages/second_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TapController controller = Get.put(TapController());
    return Scaffold(
        body: SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GetBuilder<TapController>(builder: (tapControl) {
          return Text("you have clicked ${tapControl.x} times");
        }),
        GestureDetector(
          onTap: () {
            controller.increase();
          },
          child: Container(
            margin: const EdgeInsets.all(20),
            width: double.maxFinite,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff89dad0)),
            child: const Center(
                child: Text(
              "Increase no of click",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => const FirstPage());
          },
          child: Container(
            margin: const EdgeInsets.all(20),
            width: double.maxFinite,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff89dad0)),
            child: const Center(
                child: Text(
              "got first page",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(const SecondPage());
          },
          child: Container(
            margin: const EdgeInsets.all(20),
            width: double.maxFinite,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff89dad0)),
            child: const Center(
                child: Text(
              "goto second page",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(20),
            width: double.maxFinite,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff89dad0)),
            child: const Center(
                child: Text(
              "Pop",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
          ),
        ),
      ]),
    ));
  }
}
