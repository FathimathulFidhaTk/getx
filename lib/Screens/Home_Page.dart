import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/Screens/Simple_HomePage.dart';
import 'package:getx/Screens/User_Page.dart';

import '../Colors/theme.dart';
import '../Controllers/count_controller.dart';
import '../Controllers/theme_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final themeController = Get.find<ThemeController>();
  final CountController countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
            "you have pushed the button this many times",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 40,
          ),
          Obx(() => Text(
                '${countController.obxCount}',
                style: TextStyle(fontSize: 48.0),
              )),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton.extended(
                onPressed: () => countController.decrement(),
                tooltip: 'simpleDecrement',
                label: Text('Decrement'),
              ),
              FloatingActionButton.extended(
                onPressed: () => countController.increment(),
                tooltip: 'simpleIncrement',
                label: Text("Increment"),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () => Get.to(SimpleHomePage()),
              child: Text("Simple Home Page")),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () => Get.to(UserPage()),
              child: Text('User Home Page'))
        ],
      ),
    );
  }
}
