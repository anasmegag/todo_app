import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:hive/hive.dart';
import 'package:todo_app/controller/controll.dart';
import 'package:todo_app/services.dart';
import '../widgets/drawer.dart';
import '../widgets/setcategories.dart';
import '../widgets/settasks.dart';

class HomePage extends StatefulWidget {
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override


  Controll c1 = Get.put(Controll());

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: blue2,
      drawer: const MyDrawer(),
      appBar: AppBar(
          actions:  [IconButton(
            onPressed: (){
              Get.defaultDialog(title: 'To_Do App',content: Center(child: Text('Made by Anas Megag'),));
            },
            icon:Icon(Icons.info_outline), color: Colors.black,)],
          backgroundColor: blue2,
          elevation: 0,
          leading: Builder(builder: ((context) {
            return IconButton(
                icon: const Icon(
                  Icons.menu_outlined,
                  color: Colors.grey,
                  size: 40,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                });
          }))),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: GetBuilder<Controll>(
          init: Controll(),
          builder: (controller) => 
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 13,
              ),
              //this text is like the title of this page
              Text(
                "What's up, ${controller.box.read("name")}",
                style: TextStyle(
                  color: blue1.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //anothher text to show catergories
              Text(
                "CATEGORIES",
                style: style1,
              ),
              const SizedBox(
                height: 20,
              ),
              SetCategories(way: 0,),
              const SizedBox(
                height: 20,
              ),
              Text(
                "TODAY'S TASCKS",
                style: style1,
              ), 
              const SizedBox(
                height: 20,
              ),
             SetTasks(
              cat: '',
              type: "today",
              big: 0,
             mylist: controller.gettodayTasks(),)
             ,
            ],
          ),
        ),
      ),
      floatingActionButton: GetBuilder<Controll>(
        init: Controll(),
        builder: (controller) => 
         FloatingActionButton(
          onPressed: () {
            controller.mytask.clear();
            controller.dateOfTask=null;
            controller.warning = '';
            controller.updated = false;
            Get.toNamed("/add");
          },
          child: const Icon(Icons.add),
        ),
      ),
      
    );
  }
}
