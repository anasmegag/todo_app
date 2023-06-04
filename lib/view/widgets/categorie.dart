import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todo_app/model/setup.dart';
import 'package:todo_app/services.dart';
import 'package:todo_app/view/pages/OneCategoryPage.dart';

class Categorie extends StatelessWidget {
  Categorie(
      {Key? key,
      required this.name,
      required this.numoftasks,
      required this.percent,
      required this.col,
      required this.index,
      required this.way})
      : super(key: key);
  String name;
  int numoftasks;
  double percent;
  Color col;
  int way;               
  int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
      elevation: 2,
      child: GestureDetector(
        onTap:(){ 
          Get.to(()=>OneCategoryPage(cat:categories[index].name,index: index,));},
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          padding: const EdgeInsets.only(left: 7, top: 5,bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 17,
              ),
              Text(
                "$numoftasks task",
                style: style1,
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 15,
              ),
              LinearPercentIndicator(
                
                width:way==0? 170:300,
                lineHeight: way==0? 5:9,
                percent: percent,
                progressColor: col,
              )
            ],
          ),
        ),
      ),
    );
  }
}
