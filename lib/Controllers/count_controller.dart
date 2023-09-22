import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Colors/app_colors.dart';

class CountController extends GetxController {
  static CountController get to => Get.find();
  var obxCount = 0.obs;
  int simpleCount = 0;

  void increment() {
    obxCount.value++;
    if (obxCount.value >= 1) {
      Get.snackbar(
          "Incremented", 'Count is Incremented to ${obxCount.value.toString()}',
          snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 1));
    } else if (obxCount.value % 2 == 0) {
      Get.snackbar("Even Count", 'Even number is ${obxCount.value.toString()}',
          snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 1));
    } else if (obxCount.value % 5 == 0) {
      Get.bottomSheet(Container(
        height: 150,
        color: ModeColors.blue,
        child: Text(
          "Count has now reached to ${obxCount.value.toString()}",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ));
    }
  }

  void decrement() {
    obxCount.value--;
    if (obxCount.value <= 0) {
      obxCount.value = 0;
      Get.defaultDialog(
          radius: 10.0,
          contentPadding: EdgeInsets.all(20.0),
          title: 'Sorry No Negative',
          middleText: 'You cannot decrement counter into negative number',
          textConfirm: 'Okay',
          confirm: OutlinedButton.icon(
              onPressed: () => Get.back(),
              icon: Icon(Icons.check),
              label: Text(
                'Okay',
                style: TextStyle(color: Colors.brown),
              )));
    }
  }

  void simpleDecrement() {
    simpleCount--;
    update();
  }

  void simpleIncrement() {
    simpleCount++;
    update();
  }
}
