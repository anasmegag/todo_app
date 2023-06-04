import 'package:flutter/material.dart';
import 'package:todo_app/controller/controll.dart';
import 'package:todo_app/services.dart';
import '../widgets/settasks.dart';
import 'package:get/get.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue2,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: blue2,
        title: Text(
          "Settings",
          style: style2,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<Controll>(
        init: Controll(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                child: Column(
                  children: [
                    SetTasks(
                      cat: '',
                      type: "all",
                      big: 1,
                      mylist: controller.taskList
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(40)))),
                      child: const Text(
                        "Delete All",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        controller.deleteAll();
                      },
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
