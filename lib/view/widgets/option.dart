import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Option extends StatelessWidget {
  Option({
    Key? key,
    required this.name,
    required this.icon,
    required this.route
  }) : super(key: key);
  String name;
  String ?route;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Get.toNamed(route!)),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Icon(icon,color: Colors.grey,),
          const SizedBox(width: 20,),
          Text(name,style: const TextStyle(fontSize: 25,color: Colors.grey),)
        ]),
      ),
    );
  }
}
