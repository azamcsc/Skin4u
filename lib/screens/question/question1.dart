import 'package:customers_app/screens/question/question11.dart';
import 'package:customers_app/screens/question/question2.dart';
import 'package:customers_app/screens/question/question5.dart';
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

class Question1 extends StatelessWidget{
  final String ? text;
  final VoidCallback ? onTap;
  final String ? image;

  const Question1({Key? key, this.text, this.onTap, this.image}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: GeneralLogo(),
          ),
          
          Column(
            children: [Image.asset("assets/splash/beauty-treatment.png", width: 150,)],
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
                  "How would you describe your skin?", 
                  style: regularTextStyle.copyWith(fontSize: 25),
                  ),
                SizedBox(height: 8,
                ),
                Text("The texture on the surface of your skin", style: regularTextStyle.copyWith(fontSize: 15, color: almondBrownColor),
                ),
                SizedBox(height:20),

                //NOTE:: TEXTFIELD
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50,
                  child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => Question2()));
                  },
                  child: Text("Dry and rough to the touch"),
                  style: ElevatedButton.styleFrom(
                  primary: almondBrownColor,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          )
                  ),

                  SizedBox(height: 10,),
                  Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50,
                  child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => Question5()));
                  },
                  child: Text("Constantly changing"),
                  style: ElevatedButton.styleFrom(
                  primary: almondBrownColor,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          )),

                  SizedBox(height: 10,),
                  Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50,
                  child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => Question8()));
                  },
                  child: Text("Shiny, constantly blotting away excess oil"),
                  style: ElevatedButton.styleFrom(
                  primary: almondBrownColor,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          )),

                 SizedBox(height: 10,),
                  Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50,
                  child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => Question11()));
                  },
                  child: Text("Fairly normal"),
                  style: ElevatedButton.styleFrom(
                  primary: almondBrownColor,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          ))

      ]))]));
      
  }
}
