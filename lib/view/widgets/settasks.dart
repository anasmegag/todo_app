import 'package:flutter/material.dart';
import 'package:todo_app/model/setDb.dart';
import 'package:todo_app/model/setup.dart';
import 'package:todo_app/view/widgets/task.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/controll.dart';

class SetTasks extends StatelessWidget {
  SetTasks({
    
    Key? key,
    required this.cat,
   
    required this.type,
    required this.big,
    required this.mylist,
  }) : super(key: key);
  int big;
  String type;

  String cat;

  List<Task> mylist;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controll>(
      init: Controll(),
      builder: (contoller) {
        return Container(
          height: big == 0 ? 300 : 540,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: ListView.builder(
            itemCount: mylist.length,
            itemBuilder: ((_, index) => OneTask(
              date: mylist[index].date,
                category: cat,
                type: type,
                myta: mylist,
                name: mylist[index].name,
                isDone: mylist[index].isDone,
                index: index)),
          ),
        );
      },
    );
  }
}
