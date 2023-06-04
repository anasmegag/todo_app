import 'package:flutter/material.dart';
import 'package:todo_app/controller/controll.dart';
import 'package:todo_app/services.dart';
import 'package:get/get.dart';
import '../widgets/setSettings.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);
  Controll c = Get.put(Controll());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue2,
      appBar: AppBar(
        backgroundColor: blue2,
        centerTitle: true,
        title: Text(
          "Settings",
          style: style2
        ),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 12,
        ),
        child: Center(
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const SizedBox(
                  height: 60,
                ),
                 CircleAvatar(
                  radius: 60,
                  backgroundImage: c.box.read<String>("sex")=="M"?const AssetImage('assets/avatar.jpg'):const AssetImage('assets/avatar2.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<Controll>(
                  init: Controll(),
                  builder: (controller) {
                    return Text(
                      controller.nameOfUser.text,
                      style: TextStyle(
                        color: blue1,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                ),
                SetSettings()
              ]),
        ),
      ),
    );
  }
}
