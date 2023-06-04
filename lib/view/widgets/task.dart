import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/controll.dart';
import 'package:todo_app/model/setup.dart';
import 'package:todo_app/services.dart';

import '../../model/setDb.dart';

class OneTask extends StatelessWidget {
  OneTask({
    Key? key,
    required this.date,
    required this.category,
    required this.name,
    required this.type,
    // required this.id,
    required this.isDone,
    required this.index,
    required this.myta,
  }) : super(key: key);
  String name;
  bool isDone;
  DateTime date;
  String type;
  String category;
  // int id;
  int index;
  List<Task> myta;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myta!=c.taskList? Get.toNamed('/t'):print("aouatef");
        //print(c.getTodayindex());

        
      },
      onLongPress: () {
        myta==c.taskList?
        Get.defaultDialog(
          
          textCancel: 'Ok',
          title: 'Delete Task',
          content: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () {
              c.deleteTask(
                  index,
                  Task(
                    name: name,
                    categorie: category,
                    date: date,
                    isDone: isDone,
                  ));
            },
            child: const Text("Delete"),
          ),
        ):print('aouatef');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 45,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        child: GetBuilder<Controll>(
            init: Controll(),
            builder: (controller) {
              return Row(
                children: [
                  myta ==c.taskList?
                  IconButton(
                    
                    onPressed: () {
                      controller.taskDone(myta[index], index);
                      
                    },
                    icon: isDone
                        ? Icon(
                            Icons.check_circle_sharp,
                            color: purpl1,
                          )
                        : controller.ourIcon,
                  ):const SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style: isDone
                          ? const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 20)
                          : const TextStyle(fontSize: 20),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
