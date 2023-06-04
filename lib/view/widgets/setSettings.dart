import 'package:flutter/material.dart';
import 'package:todo_app/model/setup.dart';
import 'package:todo_app/view/widgets/oneSetting.dart';


class SetSettings extends StatelessWidget {
  const SetSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 20,),
      child: ListView(
        children: settings.map((e) => OneSetting(name: e.name, icon: e.icon, fun: e.fun)).toList(),
      ),
    );
  }
}