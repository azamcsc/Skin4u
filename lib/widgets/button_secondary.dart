import 'package:flutter/material.dart';
import 'package:customers_app/consts/theme.dart';

class ButtonSecondary extends StatelessWidget {
  final String ? text;
  final VoidCallback ? onTap;

  ButtonSecondary({this.text,this.onTap,});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(text!),
        style: ElevatedButton.styleFrom(
          primary: almondBrownColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20))),
          )
          
        );
  }
}