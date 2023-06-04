import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/controller/controll.dart';
import 'package:todo_app/view/pages/HomePage.dart';
import 'package:todo_app/view/pages/OneCategoryPage.dart';
import 'package:todo_app/view/pages/settingspage.dart';
import 'package:todo_app/view/pages/tasksPage.dart';
import 'package:todo_app/view/pages/welcomePage.dart';
import 'package:get/get.dart';
import 'model/setDb.dart';
import 'view/pages/addtaskPage.dart';
import 'view/pages/categoriesPage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get_storage/get_storage.dart';
main()async{

  WidgetsFlutterBinding.ensureInitialized();

  Directory path = await getApplicationDocumentsDirectory();
  

  await Hive.initFlutter(path.path);

   Hive.registerAdapter<Task>(TaskAdapter());

  
  await Hive.openBox<Task>("myTasks");
  await GetStorage.init();
  runApp(const Myapp());
}

final c = Get.put(Controll());
Widget determinPage(){
  if(c.box.read("opened")==true){return HomePage();}
  else {return WelcomePage();}
  
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    print("${c.box.read("opened")}");
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/homeP', page: ()=>HomePage()),
        GetPage(name: '/t', page: ()=>TasksPage()), 
        GetPage(name: '/c', page: ()=>CategoriesPage()),
        GetPage(name: '/s', page: ()=>SettingsPage()),
        GetPage(name: '/add', page: ()=>AddTaskPage()),        
      ],
      home:determinPage()
    );
  }
}