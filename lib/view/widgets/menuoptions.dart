import 'package:flutter/material.dart';
import 'package:todo_app/model/setup.dart';
import 'package:todo_app/view/widgets/option.dart';


class MenuOptions extends StatelessWidget {
  const MenuOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        children: menuoptions.map((e) => Option(name: e.name, icon: e.icon,route: e.rout,)).toList()
      ),
    );
  }
}