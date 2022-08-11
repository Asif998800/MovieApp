import 'package:flutter/material.dart';

Widget customTextField (String hintText,controller, IconData prefixIcon){
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.red),
      prefixIcon: Icon(prefixIcon,color: Colors.red,),
    ),);
}