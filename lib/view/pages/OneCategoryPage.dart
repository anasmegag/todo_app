import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/controll.dart';
import 'package:todo_app/model/setup.dart';
import '../../services.dart';
import '../widgets/settasks.dart';

class OneCategoryPage extends StatelessWidget {
  OneCategoryPage({Key? key,required this.cat,required this.index}) : super(key: key);
  String cat ;
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue2,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: blue2,
        title: Text(
          "$cat Tasks ",
          style: style2,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<Controll>(
        init: Controll(),
        builder: (controller) {
          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 12,
              ),
              padding: const EdgeInsets.all(4),
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: blue1,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "All Tasks",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(children: [
                SetTasks(
                  cat: cat,
                  type: "category",
                  mylist: controller.getCategoryTasks(name:cat),
                  big: 1,
                ),
              ]),
            ),
          ]);
        }
      ),
    );
  }
}
