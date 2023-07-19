import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({required this.text,required this.onTap, super.key});
  VoidCallback? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Center(child: Text(text,style: TextStyle(color: Colors.black),)),
      ),
    );
  }
}
