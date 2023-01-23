import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather/app/modules/home/controllers/home_controller.dart';

class LoadingView extends GetView<HomeController> {
  const LoadingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 160,
      height: 160,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(() {
            return controller.enableTry.value
                ? ElevatedButton(
                    onPressed: () {
                      controller.enableTry.value = false;
                      controller.init();
                    },
                    child: Text("Try again"))
                : CircularProgressIndicator();
          }),
          FittedBox(
            child: Container(
                width: 128,
                child: Obx(() {
                  return Text(
                    "${controller.statusText}",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  );
                })),
          ),
        ],
      ),
    );
  }
}
