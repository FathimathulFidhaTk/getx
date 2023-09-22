import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/Screens/User_Page.dart';

import '../Colors/theme.dart';
import '../Controllers/count_controller.dart';
import '../Controllers/theme_controller.dart';

class SimpleHomePage extends StatelessWidget {
  SimpleHomePage({Key? key}) : super(key: key);
  final themeController = Get.find<ThemeController>();
  final CountController controller = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple State Management"),
        actions: [
          IconButton(
              onPressed: () {
                if (Get.isDarkMode) {
                  themeController.changeTheme(Themes.lightTheme);
                  themeController.saveTheme(false);
                } else {
                  themeController.changeTheme(Themes.darkTheme);
                  themeController.saveTheme(true);
                }
              },
              icon: Get.isDarkMode
                  ? const Icon(Icons.light_mode_outlined)
                  : const Icon(Icons.dark_mode_outlined))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have pushed this many times',
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(
            height: 40,
          ),
          GetBuilder<CountController>(builder: (counter) {
            return Text(counter.simpleCount.toString(),
                style: TextStyle(fontSize: 35));
          }),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  controller.simpleDecrement();
                },
                child: Icon(Icons.remove),
                tooltip: 'decrement',
              ),
              FloatingActionButton(
                onPressed: () {
                  controller.simpleIncrement();
                },
                child: Icon(
                  Icons.add,
                ),
                tooltip: 'increment',
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () => Get.to(UserPage()),
              child: Text("User Home Page"))
        ],
      ),
    );
  }
}
