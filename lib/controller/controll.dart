import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
 import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/model/setup.dart';
 import 'package:hive/hive.dart';
import 'package:todo_app/view/pages/welcomePage.dart';
import '../model/setDb.dart';
import '../services.dart';

class Controll extends GetxController {
  //____________________________
  //____________________________
  //____________________________

  //this part is for the welcome Page
  TextEditingController nameOfUser = TextEditingController();
  String sex = "M";

  //this variable is to put the name of the user in all the program
  String erorForName = "";

  //tis function for change the sex it will be usfull for the image of the avatar
  sexChanger(String? val) {
    sex = val!;
    update();
  }

//this function will determin if the name of the user is umpty or not
//if it is empty it will send a message to tell him to put his neme
// else it will get him to the home page

  emptyNameCheck(TextEditingController txt) {
    if (txt.text == "") {
      erorForName = "put you name";
      update();
    } else {
      isAlreadywelcomed = true;
      storeInfo(nameOfUser.text, sex, isAlreadywelcomed);
      Get.offNamed("/homeP");
      print("${box.read("opened")}");
    }
  }

//____________________________________
//____________________________________
//
//this part is for saving the name and sex and know that the welcome page
//is already open

  final box = GetStorage();
  bool isAlreadywelcomed = false;

  storeInfo(String? name, String? sex, bool? opened) {
    box.write("name", name!);
    box.write("sex", sex!);
    box.write("opened", opened!);
  }

//___________________
//this part is when the user set a task done it will
// have a chek and will change the color
//also if we tap it again we will uncheck it
//

  Icon ourIcon = Icon(
    Icons.circle_outlined,
    color: blue1,
  );

  taskDone(Task task, int index) {
   task.isDone == false
        ? {
            tasksbox.putAt(
                index,
                Task(
                    name: task.name,
                    categorie: task.categorie,
                    date: task.date,
                    isDone: true)),
          }
        : {
            tasksbox.putAt(
                index,
                Task(
                    name: task.name,
                    categorie: task.categorie,
                    date: task.date,
                    isDone: false)),
          };
        
    task.isDone == false
        ? taskList[index] = Task(
            name: task.name,
            categorie: task.categorie,
            date: task.date,
            isDone: true)
        : taskList[index] = Task(
            name: task.name,
            categorie: task.categorie,
            date: task.date,
            isDone: false);
    update();
  }

//_________________

//we will make a fuction to delete one note

  deleteTask(int index,Task task) {
     tasksbox.delete(index);
    taskList.removeAt(index);
    update();
  }

//this part is to store categories informations number of tasks and percentage

  getnumberDonetasks(String name) {
    return taskList
        .where((element) => element.categorie == name && element.isDone == true)
        .toList()
        .length;
  }

  double getCatetegoryPercentage(String name) {
    if (getCategoryTasks(name: name).length == 0) {
      return 0.0;
    } else {
      return getnumberDonetasks(name) / getCategoryTasks(name: name).length;
    }
  }

//this part is to add get the note and add it to the list

  TextEditingController mytask = TextEditingController();

//this variable is very important because it will initialize the date of the task
  var dateOfTask;

//this function will show the calendar
  choseDate(BuildContext context) async {
    dateOfTask = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    update();
  }

// we will creat this fuction to choose the categorie of the task

  InfoOfCategorie chosenCategory = categories[0];
  bool updated = false;
  choseCategory() {
    Get.defaultDialog(
        textCancel: 'Ok',
        title: 'choosen Category',
        content: Container(
            height: 330,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: SingleChildScrollView(
              child: Column(
                  children: categories
                      .map((e) => SafeArea(
                              child: GestureDetector(
                            onTap: () {
                              chosenCategory = e;
                              updated = true;
                              update();
                            },
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: e.col,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    e.name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Icon(
                                    Icons.circle_outlined,
                                    color: e.col,
                                  )
                                ],
                              ),
                            ),
                          )))
                      .toList()),
            )));
  }

  //______________________________

// we will another fuction to determine if the task is complete or not
  //late Box mybox;

 // late Box<Task> tasksbox;
  late List<Task> taskList = [];
 late Box<Task> tasksbox ;
//here we ininlisze our list
  Controll() {
     tasksbox = Hive.box<Task>('myTasks');
    for (int i = 0; i < tasksbox.values.length; i++) {
      taskList.add(tasksbox.getAt(i)!);
    }
  }



   gettodayTasks() {

    return taskList
        .where((e) => (e.date.day == DateTime.now().day &&
            e.date.month == DateTime.now().month &&
            e.date.year == DateTime.now().year))
        .toList();
  }

// this fuction is to determine specefic category

  getCategoryTasks({
    required String name,
  }) {
    return taskList.where((element) => element.categorie == name).toList();
  }

//this fuction will delete all the tasks

  deleteAll() {
     tasksbox.clear();
    taskList = [];
    update();
  }



//this fuction checks if the task is well writen or not
  String warning = '';
  checkTask(
    TextEditingController task,
  ) {
    if (task.text == "") {
      warning = 'enter the task and choose the date';
      update();
    } else {
    
      tasksbox.add(Task(
        name: mytask.text,
        categorie: chosenCategory.name,
        date: dateOfTask ?? DateTime.now(),
        isDone: false,
      ));
      taskList.add(Task(
        name: mytask.text,
        categorie: chosenCategory.name,
        date: dateOfTask ?? DateTime.now(),
        isDone: false,
      ));
      Get.offNamed("/homeP");
    }
  }
  //
  //
  //
  //___________________________

  /// we will create here a function that change the name if it needed

  changeMyInfo() {
    Get.defaultDialog(
      onConfirm: emptyNameCheck(nameOfUser),
      textCancel: 'cancel',
      textConfirm: 'change',
      content: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: nameOfUser,
              decoration: const InputDecoration(hintText: 'name'),
              cursorColor: blue1,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Male"),
                Radio(
                    value: "M",
                    groupValue: c.sex,
                    onChanged: (String? val) {
                      sexChanger(val);
                    }),
                const SizedBox(
                  width: 30,
                ),
                const Text("Female"),
                Radio(
                    value: "F",
                    groupValue: c.sex,
                    onChanged: (String? val) {
                      sexChanger(val);
                    })
              ],
            ),
          ),
        ],
      ),
      title: 'change your info',
    );
  }
  //______________________

  //now we will create the delete app fuction
  //this function will clear all the data base and the user name informations add
  //all the tasks
  deleteProfile() {
    box.erase();
     tasksbox.clear();
    taskList = [];
    nameOfUser.clear();
    erorForName = '';
    Get.off(WelcomePage());
    update();
  }
}
