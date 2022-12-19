import 'package:customers_app/screens/question/question2.dart';
import 'package:customers_app/screens/question/question7.dart';
import 'package:customers_app/screens/question/question8.dart';
import 'package:customers_app/widgets/button_secondary.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:customers_app/screens/diagnosis/diagnosis.dart';
import 'package:customers_app/widgets/button_primary.dart';
import 'package:customers_app/widgets/button_secondary.dart';
import 'package:customers_app/widgets/general_logo.dart';
import 'package:customers_app/widgets/widget_illustration.dart';
import 'package:customers_app/consts/theme.dart';

class Question6 extends StatelessWidget{
  final String ? text;
  final VoidCallback ? onTap;
  final String ? image;

  const Question6({Key? key, this.text, this.onTap, this.image}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: GeneralLogo(),
          ),
          
          Column(
            children: [Image.asset("assets/splash/beauty-treatment.png", width: 250,)],
          ),

          // Container(
          //   Image.asset("assets/beauty-treatment.png", width: 250,)
          // ),

          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Do you often get acne in the T-zone area only?", 
                  style: regularTextStyle.copyWith(fontSize: 25),
                  ),
                SizedBox(height: 8,
                ),
                Text("Rarely gets acne on the cheeks and chin.", style: regularTextStyle.copyWith(fontSize: 15, color: almondBrownColor),
                ),
                SizedBox(height:20),

                //NOTE:: TEXTFIELD
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50,
                  child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => Question7()));
                  },
                  child: Text("YES"),
                  style: ElevatedButton.styleFrom(
                  primary: almondBrownColor,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          )
      // body: GeneralLogo(
      //   child: Column (
      //     children: [
      //       SizedBox(
      //         height: 45,
      //       ),
      //       WidgetIllustration(
      //         image: "assets/beauty-treatment.png",
      //         title: "Have you experience tightness on your skin?",
      //         subtitle1: "Usually occur after washing your face",
      //         subtitle2: "",
      //         child: ButtonPrimary
      //         (text: "YES", 
      //         onTap: (){
      //           Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => Question2()));
      //         },
      //         ),
      //       )
      //       ],
      //       ),
      // ),
                  ),

                  SizedBox(height: 24,),
                  Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50,
                  child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => Question8()));
                  },
                  child: Text("NO"),
                  style: ElevatedButton.styleFrom(
                  primary: almondBrownColor,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          ))
      ]))]));
      
  }
}
