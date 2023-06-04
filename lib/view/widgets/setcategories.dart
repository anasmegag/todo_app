import 'package:flutter/material.dart';
import 'package:todo_app/model/setup.dart';
import 'package:todo_app/view/widgets/categorie.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/controll.dart';

class SetCategories extends StatelessWidget {
   SetCategories({Key? key, required this.way}) : super(key: key);
  int way;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<Controll>(
        init: Controll(),
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection:way==0? Axis.horizontal:Axis.vertical,
              itemBuilder : (_,i)=>
               Categorie(
                index: i,
                        name: categories[i].name,
                        numoftasks: controller.getCategoryTasks(name:categories[i].name).length,
                        percent: controller.getCatetegoryPercentage(categories[i].name),
                        col: categories[i].col,
                        way: way,
              
              
                      )
              
              
            ),
          );
        }
      ),
    );
  }
}
