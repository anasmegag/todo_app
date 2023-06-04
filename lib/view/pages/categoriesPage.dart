import 'package:flutter/material.dart';
import 'package:todo_app/view/widgets/setcategories.dart';

import '../../services.dart';

class CategoriesPage extends StatelessWidget {
   CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: blue2,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: blue2,
        title: Text("Categories",style: style2,),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 12,),
            padding: const EdgeInsets.all(4),
             alignment: Alignment.center,
             height: 50,
             width: double.infinity,
          decoration: BoxDecoration(color: blue1,borderRadius: BorderRadius.circular(10),),
           child: const Text("All Categories",style:  TextStyle(
           color:Colors.white,
           fontWeight: FontWeight.bold,
           fontSize: 32,),),),
           SetCategories(way: 1)
    
        ]),
      
    );
   
  }
}