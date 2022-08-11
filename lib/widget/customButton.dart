import 'package:flutter/material.dart';

Widget customButton (String buttonText,onPressed){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: Size(340, 50),
      primary: Colors.red, // background
      onPrimary: Colors.white, // foreground
      elevation: 15,
    ),
    onPressed: onPressed,
    child: Text(buttonText,style: TextStyle(fontSize: 18),),
  );
}