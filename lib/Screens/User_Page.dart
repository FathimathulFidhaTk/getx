import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controllers/count_controller.dart';
import '../Controllers/user_controller.dart';

class UserPage extends StatelessWidget {
  UserPage({Key? key}) : super(key: key);
  final UserController controller = Get.put(UserController());
  final CountController countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            TextField(
              controller: controller.editingController,
              decoration: InputDecoration(
                  labelText: 'Enter User Name', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 40,
            ),
            GetX<UserController>(builder: (value) {
              return Text(
                'UserName: ${value.person.value.personname}',
                style: TextStyle(fontSize: 12),
              );
            }),
            Obx(() => Text(
                  'Age: ${countController.obxCount}',
                  style: TextStyle(fontSize: 22),
                )),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.updatePerson(countController.obxCount.toString());
                },
                child: Text('Update UserName'))
          ],
        ),
      ),
    );
  }
}
