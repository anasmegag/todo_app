import 'package:flutter/material.dart';
import 'package:todo_app/controller/controll.dart';
import 'package:todo_app/services.dart';
import 'package:todo_app/view/widgets/menuoptions.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: blue1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: GetBuilder<Controll>(
          init: Controll(),
          builder: (
            
            (controller) => 
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const SizedBox(
                height: 100,
              ),
              CircleAvatar(
                // backgroundColor: blue1,
                radius: 60,
                backgroundImage:controller.box.read<String>("sex")=="M"?const AssetImage('assets/avatar.jpg'):const AssetImage('assets/avatar2.png'),
              ),
              const SizedBox(
                height: 20,
              ),
               Text(
                "Hello,   ${controller.box.read("name")}",
                style:const TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              const MenuOptions()
            ],
          )
        ),
      ),
        )    );
  }
}
