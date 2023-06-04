import 'package:flutter/material.dart';
import 'package:todo_app/model/setDb.dart';
import 'package:todo_app/services.dart';
import 'package:get/get.dart';
// import 'package:hive/hive.dart';
import 'package:todo_app/view/pages/categoriesPage.dart';
import 'package:todo_app/controller/controll.dart';

Controll c = Get.put(Controll());



List<Setting> settings = [
  Setting(
    name: "Profile",
    icon: Icons.person,
    fun: () async{
        c.changeMyInfo();
    },
  ),
  Setting(
    name: "Categories",
    icon: Icons.category_sharp,
    fun: () async{
      Get.toNamed("/c");
    },
  ),
  Setting(
    name: "Tasks",
    icon: Icons.task,
    fun: () async{
      Get.toNamed("/t");
    },
  ),
   Setting(
    name: "Delete profile",
    icon: Icons.delete,
    fun: ()async {
      c.deleteProfile();
    },
  ),
];

List<InfoOfCategorie> categories = [
  InfoOfCategorie(
    name: "Buisness",
    col: blue1,
  ),
  InfoOfCategorie(
      name: "Pesonal",
      col: Colors.green),
  InfoOfCategorie(
      name: "Sport",
      col: Colors.blueGrey),
  InfoOfCategorie(
      name: "Study",
      col: Colors.red),
  InfoOfCategorie(
    name: "Shoping",
    col: Colors.yellow,
  ),
  InfoOfCategorie(
    name: "Health",
    col: Colors.teal,
  ),
  InfoOfCategorie(
    name: "Culture",
    col: purpl1,
  ),
  InfoOfCategorie(
    name: "Other",
    col: blue1,
  ),
];

List<Menuoption> menuoptions = [
  Menuoption(name: "Tasks", rout: "/t", icon: Icons.task),
  Menuoption(name: "Categories", rout: "/c", icon: Icons.category_outlined),
  Menuoption(name: "Settings", rout: "/s", icon: Icons.settings),
];

class InfoOfCategorie {
  String name;
  Color col;

  InfoOfCategorie(
      {required this.name,
      required this.col});
}



class Menuoption {
  String name;
  String rout;
  IconData icon;
  Menuoption({
    required this.name,
    required this.rout,
    required this.icon,
  });
}

class Setting {
  String name;
  IconData icon;
  Function fun;
  Setting({
    required this.name,
    required this.icon,
    required this.fun,
  });
}
