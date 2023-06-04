import 'package:flutter/material.dart';
import 'package:todo_app/controller/controll.dart';
import 'package:todo_app/services.dart';
import 'package:get/get.dart';
import 'package:todo_app/view/pages/HomePage.dart';

//this page is only to the welcome and get the name of the user
// it shows to get the name of the person and sex

class WelcomePage extends StatelessWidget {
   WelcomePage({Key? key}) : super(key: key);
  Controll c = Get.put(Controll(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: GetBuilder<Controll>(
            init: Controll(),
            builder: ((controller) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage('assets/firstimg.png'),
                    ),
                    Text(
                      'ToDo List',
                      style: TextStyle(
                        fontSize: 50,
                        color: blue1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Manege and Save your time!',
                      style: style1,
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    const Text(
                      "Sign your name: ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextFormField(
                        controller: controller.nameOfUser,
                        decoration: const InputDecoration(hintText: 'name'),
                        cursorColor: blue1,
                      ),
                    ),
                    Text(
                      controller.erorForName,
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Male"),
                          Radio(
                              value: "M",
                              groupValue: c.sex,
                              onChanged: (String? val) {
                                controller.sexChanger(val);
                              }),
                          const SizedBox(
                            width: 30,
                          ),
                          const Text("Female"),
                          Radio(
                              value: "F",
                              groupValue: c.sex,
                              onChanged: (String? val) {
                                c.sexChanger(val);
                              })
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(blue1),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)))),
                        child: const Text(
                          "Get Started !",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          c.emptyNameCheck(c.nameOfUser);
                        },
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
