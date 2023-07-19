import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  CustomTextFormFeild({this.hientText, this.onChanged,this.obscuretxxt=false, super.key,  this.maxLines, this.onSaved,this.onSubmitted,this.controller});
  String? hientText;
  Function(String)? onChanged;
  Function(String)? onSubmitted;
  bool? obscuretxxt;
  TextEditingController? controller;

 int? maxLines;
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuretxxt!,
      validator: (value) {
        if (value!.isEmpty) {
          return 'field is required';
        }
      },
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hientText,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
