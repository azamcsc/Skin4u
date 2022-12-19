//import 'package:email_password_login/screens/question/question2.dart';
import 'package:customers_app/screens/information/splash/splashscreen2.dart';
//import 'package:email_password_login/widgets/button_secondary.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:email_password_login/screens/diagnosis/diagnosis.dart';
//import 'package:email_password_login/widgets/button_primary.dart';
//import 'package:email_password_login/widgets/button_secondary.dart';
//import 'package:email_password_login/widgets/general_logo.dart';
//import 'package:email_password_login/widgets/widget_illustration.dart';
import 'package:customers_app/consts/theme.dart';

class SplashScreen1 extends StatelessWidget{
  final String ? text;
  // final VoidCallback ? onTap;
  final String ? image;

  const SplashScreen1({Key? key, this.text, this.image}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ListView(
      //   children: [
      //     Container(
      //       child: GeneralLogo(),
      //     ),
          
      //     Column(
      //       children: [Image.asset("assets/sunscreen.jpg", width: 250,)],
      //     ),

          // Container(
          //   Image.asset("assets/beauty-treatment.png", width: 250,)
          // ),

          backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_forward, color: Colors.red),
          onPressed: () {
            // passing this to our root
            Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => SplashScreen2()));
          },
        ),
      ),body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Container(
                child: Image.asset("assets/splash/sunscreen.jpg", width: 250,)
                  ),
                Text(
                  "Importance of sunscreen!", 
                  style: regularTextStyle.copyWith(fontSize: 25, color: black),
                  ),
                SizedBox(height: 8,
                ),
                Text("Reduce the Risk of Skin Cancer - When the skin becomes burnt from the sun, it is ultimately damaged from the exposure to the UV rays. This damage can lead to the development of skin cancer, which can be incredibly dangerous and devastating to your life.", style: regularTextStyle.copyWith(fontSize: 15, color: almondBrownColor),
                ),
                SizedBox(height: 8,
                ),
                Text("Avoid Sunburns - Sunburns are never particularly pleasant to experience. In addition, they can result in an array of other issues with your health. When you sustain a sunburn, it is likely that you will experience a stinging, unpleasantly hot sensation.", style: regularTextStyle.copyWith(fontSize: 15, color: almondBrownColor),
                ),
                SizedBox(height: 8,
                ),
                Text("Helps to Maintain an Even Skin Tone - Damage from the sun UV rays can create an uneven skin tone for your skin. It is highly unlikely that your skin will be exposed to UV rays evenly throughout your body, which causes the uneven skin tone to arise.", style: regularTextStyle.copyWith(fontSize: 15, color: almondBrownColor),
                ),
                SizedBox(height: 8,
                ),
                Text("Reduces the Likelihood of Premature Aging - This can cause the development of wrinkles or other types of damage. When wrinkles develop, they will cause your skin to appear older than it otherwise might. Wearing sunscreen regularly can help to eliminate the likelihood of premature aging, which will help you to maintain a healthy, youthful appearance.", style: regularTextStyle.copyWith(fontSize: 15, color: almondBrownColor),
                ),
                SizedBox(height:20),
                ])))));}}