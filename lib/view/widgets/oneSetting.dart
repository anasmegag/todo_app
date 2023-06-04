import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class OneSetting extends StatelessWidget {
   OneSetting({Key? key , required this.name,required this.icon,required this.fun,}) : super(key: key);
  IconData icon;
  String name;
  Function fun;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){fun();},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 15,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon),
            const SizedBox(width: 15,),
            Text(name,style: const TextStyle(fontSize: 26),),
              ],
            ),
           
            const Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }
}