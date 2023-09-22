import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx/model/usermodel.dart';

class UserController extends GetxController {
  final person = Person().obs;
  final editingController = TextEditingController();

  updatePerson(String age) {
    person.update((val) {
      val?.personname = editingController.text;
      val?.personage = age;
    });
  }
}
