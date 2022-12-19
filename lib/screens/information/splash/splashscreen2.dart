//import 'package:email_password_login/screens/question/question2.dart';
//import 'package:email_password_login/widgets/button_secondary.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:email_password_login/screens/diagnosis/diagnosis.dart';
//import 'package:email_password_login/widgets/button_primary.dart';
//import 'package:email_password_login/widgets/button_secondary.dart';
import 'package:customers_app/widgets/general_logo.dart';
//import 'package:email_password_login/widgets/widget_illustration.dart';
import 'package:customers_app/consts/theme.dart';

class SplashScreen2 extends StatelessWidget{
  final String ? text;
  // final VoidCallback ? onTap;
  final String ? image;

  const SplashScreen2({Key? key, this.text, this.image}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: GeneralLogo(),
          ),
          
          // Column(
          //   children: [Image.asset("assets/skincare tools.jpg", width: 250,)],
          // ),

          // Container(
          //   Image.asset("assets/beauty-treatment.png", width: 250,)
          // ),

          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Skincare Tools You Might Need!", 
                  style: regularTextStyle.copyWith(fontSize: 25, color: black),
                  ),
                SizedBox(height: 8,
                ),
                Column(
                children: [Image.asset("assets/splash/faceroller.jpg", width: 100,)],
               ),
               SizedBox(height: 8,
                ),
                Text("Face Roller", style: regularTextStyle.copyWith(fontSize: 15, color: almondBrownColor),
                ),
                SizedBox(height: 8,
                ),
                 Column(
                children: [Image.asset("assets/splash/cleansingbrush.jpg", width: 100,)],
               ),
               SizedBox(height: 8,
                ),
                Text("Cleansing Brush", style: regularTextStyle.copyWith(fontSize: 15, color: almondBrownColor),
                ),
                SizedBox(height: 8,
                ),
                 Column(
                children: [Image.asset("assets/splash/lightmask.jpg", width: 100,)],
               ),
               SizedBox(height: 8,
                ),
                Text("Light Mask", style: regularTextStyle.copyWith(fontSize: 15, color: almondBrownColor),
                ),
                SizedBox(height: 8,
                ),
                 Column(
                children: [Image.asset("assets/splash/facesteam.jpg", width: 100,)],
               ),
               SizedBox(height: 8,
                ),
                Text("Face Steamer", style: regularTextStyle.copyWith(fontSize: 15, color: almondBrownColor),
                ),
                SizedBox(height:20),
                ]))]));}}