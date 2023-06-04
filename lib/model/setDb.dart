import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
 part 'setDb.g.dart';

// // @HiveType(typeId: 0)
// // class Task extends HiveObject{
// //   @HiveField(0)
// //   late String name;
// //   @HiveField(1)
// //   late String categorie;
// //   @HiveField(2)
// //   late DateTime date;
// //   @HiveField(3)
// //   late bool isDone;
@HiveType(typeId: 0)
class Task extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String categorie;
  @HiveField(2)
  late DateTime date;
  @HiveField(3)
  late bool isDone;

  Task({

    required this.name,
    required this.categorie,
    required this.date,
    required this.isDone
  });
}
