import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/controller/controll.dart';
import 'package:todo_app/model/setup.dart';
import 'package:todo_app/services.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final dd = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: GetBuilder<Controll>(
              init: Controll(),
              builder: (controller) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller:controller.mytask ,
                      style: const TextStyle(fontSize: 30),
                      decoration:const InputDecoration(
                        
                        hintText: 'Add a new task',
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 35,fontWeight: FontWeight.w400)
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        choise(
                          icon: Icons.calendar_today_outlined,
                          col: Colors.grey,
                          f1: ()async{
                            controller.choseDate(context);
                          }                ,
                          name:  Text(
                            controller.dateOfTask==null?
                            "Today": "${controller.dateOfTask.day}/${controller.dateOfTask.month}",
                            style:const TextStyle(
                              color: Colors.grey,
                              fontSize: 18.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        choise(
                          icon:controller.updated? Icons.check_circle_outline: Icons.circle_outlined,
                          col: controller.chosenCategory.col,
                          f1: () async{ 
                           controller.choseCategory();
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 80,),
                    Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(blue1),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)))),
                      child: const Text(
                        "Add Task !",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                       controller.checkTask(controller.mytask);
                       //await controller.gettodayTasks(controller.taskList);
                      },
                    ),
                  ),
                  Text(controller.warning,style:const TextStyle(color: Colors.red),)
                  ],
                );
              }
            ),
          ),
        ),
      ),
      
    );
  }

  InkWell choise ({
    required IconData icon,
    required Function f1,
    required Color col,
    Widget? name,
  }) {
    return InkWell (
      onTap: (){f1();},
      child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 01, color: Colors.grey),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 32,
                color: col,
              ),
              name != null
                  ? const SizedBox(
                      width: 10,
                    )
                  : Container(),
              name ?? Container(),
            ],
          )),
    );
  }
}
