import 'package:flutter/material.dart';

import 'constants.dart';

class ItemStudent extends StatelessWidget {
   ItemStudent({super.key,required this.name,required this.grade});
  String? name, grade;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
        decoration: BoxDecoration(
            color: kPrimaryColorTwo, borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          leading: Text(
            name!,
            style: TextStyle(),
          ),
          trailing: Text(
            '${grade!}/50',
            style: TextStyle(),
          ),
        ));
    ;
  }
}
